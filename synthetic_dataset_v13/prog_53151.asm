; DESCRIPTION: Creates a blue rectangular region at (393, 33) spanning 52 by 99 pixels.
; PLAN: r0=393(x), r1=33(y), r2=52(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 33
LDI r2, 52
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
