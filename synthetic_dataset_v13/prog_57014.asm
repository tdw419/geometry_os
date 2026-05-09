; DESCRIPTION: Renders a purple box of size 81x40 starting at (408, 120).
; PLAN: r0=408(x), r1=120(y), r2=81(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 120
LDI r2, 81
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
