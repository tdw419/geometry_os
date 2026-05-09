; DESCRIPTION: Creates a purple rectangular region at (120, 81) spanning 26 by 37 pixels.
; PLAN: r0=120(x), r1=81(y), r2=26(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 81
LDI r2, 26
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
