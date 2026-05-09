; DESCRIPTION: Places a yellow 52x95 rectangle at position (213, 147).
; PLAN: r0=213(x), r1=147(y), r2=52(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 147
LDI r2, 52
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
