; DESCRIPTION: Creates a purple rectangular region at (136, 185) spanning 52 by 50 pixels.
; PLAN: r0=136(x), r1=185(y), r2=52(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 185
LDI r2, 52
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
