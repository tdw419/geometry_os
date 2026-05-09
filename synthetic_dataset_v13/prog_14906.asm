; DESCRIPTION: Creates a green rectangular region at (181, 95) spanning 80 by 79 pixels.
; PLAN: r0=181(x), r1=95(y), r2=80(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 95
LDI r2, 80
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
