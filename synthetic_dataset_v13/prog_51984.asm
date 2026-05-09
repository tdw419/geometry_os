; DESCRIPTION: Creates a green rectangular region at (212, 79) spanning 85 by 87 pixels.
; PLAN: r0=212(x), r1=79(y), r2=85(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 79
LDI r2, 85
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
