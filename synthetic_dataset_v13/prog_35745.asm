; DESCRIPTION: Places a black 17x44 rectangle at position (253, 147).
; PLAN: r0=253(x), r1=147(y), r2=17(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 147
LDI r2, 17
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
