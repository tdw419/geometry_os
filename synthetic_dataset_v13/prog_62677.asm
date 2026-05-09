; DESCRIPTION: Creates a purple rectangular region at (362, 24) spanning 84 by 87 pixels.
; PLAN: r0=362(x), r1=24(y), r2=84(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 24
LDI r2, 84
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
