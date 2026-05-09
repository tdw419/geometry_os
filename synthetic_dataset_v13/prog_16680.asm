; DESCRIPTION: Renders a purple box of size 106x22 starting at (285, 93).
; PLAN: r0=285(x), r1=93(y), r2=106(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 93
LDI r2, 106
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
