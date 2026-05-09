; DESCRIPTION: Renders a green box of size 95x94 starting at (0, 23).
; PLAN: r0=0(x), r1=23(y), r2=95(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 23
LDI r2, 95
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
