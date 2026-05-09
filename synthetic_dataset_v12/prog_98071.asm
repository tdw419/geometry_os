; DESCRIPTION: Creates a green rectangular region at (106, 3) spanning 79 by 73 pixels.
; PLAN: r0=106(x), r1=3(y), r2=79(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 3
LDI r2, 79
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
