; DESCRIPTION: Creates a blue rectangular region at (217, 77) spanning 44 by 118 pixels.
; PLAN: r0=217(x), r1=77(y), r2=44(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 77
LDI r2, 44
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
