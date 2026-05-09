; DESCRIPTION: Renders a white box of size 91x26 starting at (95, 212).
; PLAN: r0=95(x), r1=212(y), r2=91(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 212
LDI r2, 91
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
