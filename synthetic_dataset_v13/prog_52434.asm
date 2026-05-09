; DESCRIPTION: Renders a green box of size 18x120 starting at (427, 3).
; PLAN: r0=427(x), r1=3(y), r2=18(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 3
LDI r2, 18
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
