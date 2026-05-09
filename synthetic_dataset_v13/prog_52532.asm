; DESCRIPTION: Renders a blue box of size 120x120 starting at (323, 66).
; PLAN: r0=323(x), r1=66(y), r2=120(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 66
LDI r2, 120
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
