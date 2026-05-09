; DESCRIPTION: Renders a green box of size 95x29 starting at (212, 47).
; PLAN: r0=212(x), r1=47(y), r2=95(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 47
LDI r2, 95
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
