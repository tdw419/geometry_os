; DESCRIPTION: Renders a yellow box of size 20x39 starting at (235, 36).
; PLAN: r0=235(x), r1=36(y), r2=20(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 36
LDI r2, 20
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
