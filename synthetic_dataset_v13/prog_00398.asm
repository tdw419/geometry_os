; DESCRIPTION: Creates a purple rectangular region at (87, 169) spanning 114 by 50 pixels.
; PLAN: r0=87(x), r1=169(y), r2=114(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 169
LDI r2, 114
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
