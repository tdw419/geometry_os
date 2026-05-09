; DESCRIPTION: Renders a green box of size 101x101 starting at (21, 94).
; PLAN: r0=21(x), r1=94(y), r2=101(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 94
LDI r2, 101
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
