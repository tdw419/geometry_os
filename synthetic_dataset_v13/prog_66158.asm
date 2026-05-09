; DESCRIPTION: Renders a yellow box of size 100x93 starting at (235, 155).
; PLAN: r0=235(x), r1=155(y), r2=100(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 155
LDI r2, 100
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
