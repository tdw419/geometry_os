; DESCRIPTION: Renders a purple box of size 22x35 starting at (235, 53).
; PLAN: r0=235(x), r1=53(y), r2=22(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 53
LDI r2, 22
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
