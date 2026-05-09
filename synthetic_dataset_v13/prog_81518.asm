; DESCRIPTION: Renders a blue box of size 52x75 starting at (394, 115).
; PLAN: r0=394(x), r1=115(y), r2=52(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 115
LDI r2, 52
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
