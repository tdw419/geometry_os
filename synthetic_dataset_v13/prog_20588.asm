; DESCRIPTION: Creates a blue rectangular region at (181, 112) spanning 71 by 80 pixels.
; PLAN: r0=181(x), r1=112(y), r2=71(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 112
LDI r2, 71
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
