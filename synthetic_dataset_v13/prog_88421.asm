; DESCRIPTION: Creates a blue rectangular region at (112, 112) spanning 18 by 80 pixels.
; PLAN: r0=112(x), r1=112(y), r2=18(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 112
LDI r2, 18
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
