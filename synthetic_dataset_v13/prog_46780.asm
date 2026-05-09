; DESCRIPTION: Renders a black box of size 63x25 starting at (292, 47).
; PLAN: r0=292(x), r1=47(y), r2=63(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 47
LDI r2, 63
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
