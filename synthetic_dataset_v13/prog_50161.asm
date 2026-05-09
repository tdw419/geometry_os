; DESCRIPTION: Renders a black box of size 56x98 starting at (270, 95).
; PLAN: r0=270(x), r1=95(y), r2=56(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 95
LDI r2, 56
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
