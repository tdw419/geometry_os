; DESCRIPTION: Renders a green box of size 50x92 starting at (185, 147).
; PLAN: r0=185(x), r1=147(y), r2=50(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 147
LDI r2, 50
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
