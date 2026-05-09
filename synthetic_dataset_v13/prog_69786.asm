; DESCRIPTION: Creates a purple rectangular region at (270, 203) spanning 86 by 13 pixels.
; PLAN: r0=270(x), r1=203(y), r2=86(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 203
LDI r2, 86
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
