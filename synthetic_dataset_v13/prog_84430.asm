; DESCRIPTION: Creates a blue rectangular region at (136, 35) spanning 86 by 25 pixels.
; PLAN: r0=136(x), r1=35(y), r2=86(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 35
LDI r2, 86
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
