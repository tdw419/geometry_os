; DESCRIPTION: Creates a green rectangular region at (220, 79) spanning 116 by 84 pixels.
; PLAN: r0=220(x), r1=79(y), r2=116(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 79
LDI r2, 116
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
