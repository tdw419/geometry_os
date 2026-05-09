; DESCRIPTION: Creates a purple rectangular region at (66, 148) spanning 79 by 96 pixels.
; PLAN: r0=66(x), r1=148(y), r2=79(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 148
LDI r2, 79
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
