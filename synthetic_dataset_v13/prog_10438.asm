; DESCRIPTION: Renders a black box of size 63x83 starting at (50, 99).
; PLAN: r0=50(x), r1=99(y), r2=63(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 99
LDI r2, 63
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
