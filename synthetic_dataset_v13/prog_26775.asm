; DESCRIPTION: Renders a yellow box of size 87x99 starting at (96, 66).
; PLAN: r0=96(x), r1=66(y), r2=87(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 66
LDI r2, 87
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
