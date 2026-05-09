; DESCRIPTION: Creates a blue rectangular region at (312, 34) spanning 112 by 70 pixels.
; PLAN: r0=312(x), r1=34(y), r2=112(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 34
LDI r2, 112
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
