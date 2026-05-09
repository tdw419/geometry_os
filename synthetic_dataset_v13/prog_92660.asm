; DESCRIPTION: Renders a green box of size 52x23 starting at (325, 148).
; PLAN: r0=325(x), r1=148(y), r2=52(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 148
LDI r2, 52
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
