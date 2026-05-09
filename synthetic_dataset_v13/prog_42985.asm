; DESCRIPTION: Renders a yellow box of size 120x29 starting at (162, 2).
; PLAN: r0=162(x), r1=2(y), r2=120(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 2
LDI r2, 120
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
