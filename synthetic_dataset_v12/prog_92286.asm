; DESCRIPTION: Renders a purple box of size 57x52 starting at (408, 85).
; PLAN: r0=408(x), r1=85(y), r2=57(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 85
LDI r2, 57
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
