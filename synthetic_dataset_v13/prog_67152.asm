; DESCRIPTION: Renders a yellow box of size 75x96 starting at (132, 91).
; PLAN: r0=132(x), r1=91(y), r2=75(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 91
LDI r2, 75
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
