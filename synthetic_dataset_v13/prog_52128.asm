; DESCRIPTION: Renders a black box of size 13x36 starting at (87, 89).
; PLAN: r0=87(x), r1=89(y), r2=13(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 89
LDI r2, 13
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
