; DESCRIPTION: Creates a purple rectangular region at (408, 137) spanning 69 by 91 pixels.
; PLAN: r0=408(x), r1=137(y), r2=69(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 137
LDI r2, 69
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
