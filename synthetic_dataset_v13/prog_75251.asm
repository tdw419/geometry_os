; DESCRIPTION: Renders a black box of size 65x57 starting at (235, 158).
; PLAN: r0=235(x), r1=158(y), r2=65(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 158
LDI r2, 65
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
