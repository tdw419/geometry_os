; DESCRIPTION: Creates a purple rectangular region at (337, 63) spanning 106 by 54 pixels.
; PLAN: r0=337(x), r1=63(y), r2=106(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 63
LDI r2, 106
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
