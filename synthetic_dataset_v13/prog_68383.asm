; DESCRIPTION: Creates a blue rectangular region at (229, 54) spanning 116 by 56 pixels.
; PLAN: r0=229(x), r1=54(y), r2=116(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 54
LDI r2, 116
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
