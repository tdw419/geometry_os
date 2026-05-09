; DESCRIPTION: Creates a purple rectangular region at (444, 147) spanning 57 by 60 pixels.
; PLAN: r0=444(x), r1=147(y), r2=57(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 147
LDI r2, 57
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
