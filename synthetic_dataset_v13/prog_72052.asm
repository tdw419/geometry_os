; DESCRIPTION: Creates a purple rectangular region at (448, 236) spanning 26 by 13 pixels.
; PLAN: r0=448(x), r1=236(y), r2=26(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 236
LDI r2, 26
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
