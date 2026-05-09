; DESCRIPTION: Renders a yellow box of size 81x99 starting at (23, 95).
; PLAN: r0=23(x), r1=95(y), r2=81(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 95
LDI r2, 81
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
