; DESCRIPTION: Places a green 27x37 rectangle at position (112, 147).
; PLAN: r0=112(x), r1=147(y), r2=27(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 147
LDI r2, 27
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
