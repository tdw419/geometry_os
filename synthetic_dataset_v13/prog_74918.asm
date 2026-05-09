; DESCRIPTION: Creates a purple rectangular region at (270, 26) spanning 91 by 79 pixels.
; PLAN: r0=270(x), r1=26(y), r2=91(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 26
LDI r2, 91
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
