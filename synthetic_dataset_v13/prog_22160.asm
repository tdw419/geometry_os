; DESCRIPTION: Renders a green box of size 48x35 starting at (136, 26).
; PLAN: r0=136(x), r1=26(y), r2=48(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 26
LDI r2, 48
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
