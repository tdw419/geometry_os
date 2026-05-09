; DESCRIPTION: Creates a blue rectangular region at (185, 202) spanning 105 by 52 pixels.
; PLAN: r0=185(x), r1=202(y), r2=105(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 202
LDI r2, 105
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
