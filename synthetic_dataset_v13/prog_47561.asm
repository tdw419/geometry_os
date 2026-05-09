; DESCRIPTION: Renders a blue box of size 118x89 starting at (346, 150).
; PLAN: r0=346(x), r1=150(y), r2=118(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 150
LDI r2, 118
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
