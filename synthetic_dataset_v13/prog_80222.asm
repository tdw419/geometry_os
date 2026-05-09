; DESCRIPTION: Creates a yellow rectangular region at (260, 136) spanning 36 by 25 pixels.
; PLAN: r0=260(x), r1=136(y), r2=36(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 136
LDI r2, 36
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
