; DESCRIPTION: Creates a cyan rectangular region at (200, 0) spanning 111 by 89 pixels.
; PLAN: r0=200(x), r1=0(y), r2=111(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 0
LDI r2, 111
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
