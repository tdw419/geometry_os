; DESCRIPTION: Renders a yellow box of size 34x66 starting at (81, 127).
; PLAN: r0=81(x), r1=127(y), r2=34(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 127
LDI r2, 34
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
