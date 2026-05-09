; DESCRIPTION: Creates a yellow rectangular region at (260, 147) spanning 82 by 74 pixels.
; PLAN: r0=260(x), r1=147(y), r2=82(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 147
LDI r2, 82
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
