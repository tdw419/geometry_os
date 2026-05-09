; DESCRIPTION: Renders a yellow box of size 37x75 starting at (101, 12).
; PLAN: r0=101(x), r1=12(y), r2=37(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 12
LDI r2, 37
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
