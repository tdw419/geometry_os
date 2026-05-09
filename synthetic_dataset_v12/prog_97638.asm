; DESCRIPTION: Renders a blue box of size 52x115 starting at (95, 19).
; PLAN: r0=95(x), r1=19(y), r2=52(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 19
LDI r2, 52
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
