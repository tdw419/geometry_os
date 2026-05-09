; DESCRIPTION: Creates a cyan rectangular region at (51, 2) spanning 111 by 111 pixels.
; PLAN: r0=51(x), r1=2(y), r2=111(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 2
LDI r2, 111
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
