; DESCRIPTION: Renders a black box of size 12x79 starting at (396, 35).
; PLAN: r0=396(x), r1=35(y), r2=12(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 35
LDI r2, 12
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
