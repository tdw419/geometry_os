; DESCRIPTION: Renders a yellow box of size 105x25 starting at (235, 60).
; PLAN: r0=235(x), r1=60(y), r2=105(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 60
LDI r2, 105
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
