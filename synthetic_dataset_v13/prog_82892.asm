; DESCRIPTION: Renders a green box of size 35x102 starting at (446, 147).
; PLAN: r0=446(x), r1=147(y), r2=35(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 147
LDI r2, 35
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
