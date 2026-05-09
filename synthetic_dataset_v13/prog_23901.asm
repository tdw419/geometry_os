; DESCRIPTION: Renders a yellow box of size 115x10 starting at (251, 196).
; PLAN: r0=251(x), r1=196(y), r2=115(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 196
LDI r2, 115
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
