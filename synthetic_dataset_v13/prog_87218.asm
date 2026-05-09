; DESCRIPTION: Renders a white box of size 98x101 starting at (292, 84).
; PLAN: r0=292(x), r1=84(y), r2=98(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 84
LDI r2, 98
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
