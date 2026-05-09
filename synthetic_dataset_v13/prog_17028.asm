; DESCRIPTION: Renders a green box of size 99x61 starting at (235, 147).
; PLAN: r0=235(x), r1=147(y), r2=99(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 147
LDI r2, 99
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
