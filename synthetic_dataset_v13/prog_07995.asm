; DESCRIPTION: Creates a blue rectangular region at (229, 79) spanning 113 by 88 pixels.
; PLAN: r0=229(x), r1=79(y), r2=113(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 79
LDI r2, 113
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
