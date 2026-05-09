; DESCRIPTION: Renders a green box of size 95x85 starting at (241, 84).
; PLAN: r0=241(x), r1=84(y), r2=95(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 84
LDI r2, 95
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
