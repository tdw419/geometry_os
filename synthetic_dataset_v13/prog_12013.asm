; DESCRIPTION: Renders a yellow box of size 101x22 starting at (18, 54).
; PLAN: r0=18(x), r1=54(y), r2=101(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 54
LDI r2, 101
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
