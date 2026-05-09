; DESCRIPTION: Creates a yellow rectangular region at (427, 64) spanning 32 by 63 pixels.
; PLAN: r0=427(x), r1=64(y), r2=32(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 64
LDI r2, 32
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
