; DESCRIPTION: Renders a magenta box of size 81x81 starting at (423, 120).
; PLAN: r0=423(x), r1=120(y), r2=81(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 120
LDI r2, 81
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
