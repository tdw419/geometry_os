; DESCRIPTION: Creates a blue rectangular region at (170, 0) spanning 45 by 66 pixels.
; PLAN: r0=170(x), r1=0(y), r2=45(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 0
LDI r2, 45
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
