; DESCRIPTION: Creates a blue rectangular region at (112, 185) spanning 75 by 60 pixels.
; PLAN: r0=112(x), r1=185(y), r2=75(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 185
LDI r2, 75
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
