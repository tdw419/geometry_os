; DESCRIPTION: Renders a green box of size 13x13 starting at (452, 169).
; PLAN: r0=452(x), r1=169(y), r2=13(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 169
LDI r2, 13
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
