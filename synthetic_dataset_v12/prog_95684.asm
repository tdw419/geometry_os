; DESCRIPTION: Renders a black box of size 63x49 starting at (264, 75).
; PLAN: r0=264(x), r1=75(y), r2=63(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 75
LDI r2, 63
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
