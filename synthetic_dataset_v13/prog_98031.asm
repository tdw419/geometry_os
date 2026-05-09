; DESCRIPTION: Renders a yellow box of size 15x26 starting at (261, 75).
; PLAN: r0=261(x), r1=75(y), r2=15(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 75
LDI r2, 15
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
