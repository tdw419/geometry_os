; DESCRIPTION: Renders a black box of size 63x52 starting at (260, 103).
; PLAN: r0=260(x), r1=103(y), r2=63(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 103
LDI r2, 63
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
