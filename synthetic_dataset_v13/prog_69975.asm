; DESCRIPTION: Renders a cyan box of size 62x22 starting at (147, 105).
; PLAN: r0=147(x), r1=105(y), r2=62(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 105
LDI r2, 62
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
