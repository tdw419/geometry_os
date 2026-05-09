; DESCRIPTION: Creates a purple rectangular region at (205, 114) spanning 37 by 75 pixels.
; PLAN: r0=205(x), r1=114(y), r2=37(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 114
LDI r2, 37
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
