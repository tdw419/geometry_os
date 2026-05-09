; DESCRIPTION: Renders a red box of size 63x89 starting at (270, 115).
; PLAN: r0=270(x), r1=115(y), r2=63(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 115
LDI r2, 63
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
