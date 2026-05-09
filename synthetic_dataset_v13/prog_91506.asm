; DESCRIPTION: Creates a yellow rectangular region at (69, 144) spanning 79 by 110 pixels.
; PLAN: r0=69(x), r1=144(y), r2=79(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 144
LDI r2, 79
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
