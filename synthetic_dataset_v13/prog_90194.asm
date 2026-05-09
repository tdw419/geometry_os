; DESCRIPTION: Creates a blue rectangular region at (45, 52) spanning 22 by 48 pixels.
; PLAN: r0=45(x), r1=52(y), r2=22(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 52
LDI r2, 22
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
