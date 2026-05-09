; DESCRIPTION: Creates a purple rectangular region at (260, 212) spanning 63 by 17 pixels.
; PLAN: r0=260(x), r1=212(y), r2=63(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 212
LDI r2, 63
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
