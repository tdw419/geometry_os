; DESCRIPTION: Renders a green box of size 63x54 starting at (336, 112).
; PLAN: r0=336(x), r1=112(y), r2=63(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 112
LDI r2, 63
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
