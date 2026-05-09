; DESCRIPTION: Renders a yellow box of size 65x88 starting at (80, 50).
; PLAN: r0=80(x), r1=50(y), r2=65(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 50
LDI r2, 65
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
