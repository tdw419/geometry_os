; DESCRIPTION: Renders a green box of size 95x44 starting at (212, 129).
; PLAN: r0=212(x), r1=129(y), r2=95(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 129
LDI r2, 95
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
