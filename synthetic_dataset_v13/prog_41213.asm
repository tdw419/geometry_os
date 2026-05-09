; DESCRIPTION: Creates a purple rectangular region at (87, 86) spanning 13 by 80 pixels.
; PLAN: r0=87(x), r1=86(y), r2=13(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 86
LDI r2, 13
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
