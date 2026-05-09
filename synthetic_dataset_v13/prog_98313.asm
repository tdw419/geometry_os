; DESCRIPTION: Renders a yellow box of size 57x96 starting at (235, 131).
; PLAN: r0=235(x), r1=131(y), r2=57(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 131
LDI r2, 57
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
