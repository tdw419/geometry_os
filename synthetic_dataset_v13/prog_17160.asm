; DESCRIPTION: Creates a purple rectangular region at (279, 147) spanning 75 by 77 pixels.
; PLAN: r0=279(x), r1=147(y), r2=75(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 147
LDI r2, 75
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
