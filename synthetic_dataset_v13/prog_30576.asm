; DESCRIPTION: Creates a purple rectangular region at (27, 147) spanning 20 by 24 pixels.
; PLAN: r0=27(x), r1=147(y), r2=20(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 147
LDI r2, 20
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
