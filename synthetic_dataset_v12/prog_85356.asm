; DESCRIPTION: Creates a purple rectangular region at (147, 132) spanning 16 by 32 pixels.
; PLAN: r0=147(x), r1=132(y), r2=16(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 132
LDI r2, 16
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
