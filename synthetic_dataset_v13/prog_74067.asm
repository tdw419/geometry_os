; DESCRIPTION: Renders a yellow box of size 80x54 starting at (30, 45).
; PLAN: r0=30(x), r1=45(y), r2=80(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 45
LDI r2, 80
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
