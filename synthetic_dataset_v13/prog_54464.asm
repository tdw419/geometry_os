; DESCRIPTION: Renders a white box of size 54x107 starting at (362, 147).
; PLAN: r0=362(x), r1=147(y), r2=54(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 147
LDI r2, 54
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
