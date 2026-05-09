; DESCRIPTION: Creates a purple rectangular region at (107, 63) spanning 99 by 112 pixels.
; PLAN: r0=107(x), r1=63(y), r2=99(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 63
LDI r2, 99
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
