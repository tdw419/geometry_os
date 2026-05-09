; DESCRIPTION: Renders a yellow box of size 115x109 starting at (309, 119).
; PLAN: r0=309(x), r1=119(y), r2=115(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 119
LDI r2, 115
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
