; DESCRIPTION: Renders a yellow box of size 29x120 starting at (463, 13).
; PLAN: r0=463(x), r1=13(y), r2=29(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 13
LDI r2, 29
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
