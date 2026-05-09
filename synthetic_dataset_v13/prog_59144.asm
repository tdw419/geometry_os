; DESCRIPTION: Renders a black box of size 30x63 starting at (229, 148).
; PLAN: r0=229(x), r1=148(y), r2=30(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 148
LDI r2, 30
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
