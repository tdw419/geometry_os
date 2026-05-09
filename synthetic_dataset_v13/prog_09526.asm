; DESCRIPTION: Creates a cyan rectangular region at (20, 141) spanning 111 by 62 pixels.
; PLAN: r0=20(x), r1=141(y), r2=111(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 141
LDI r2, 111
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
