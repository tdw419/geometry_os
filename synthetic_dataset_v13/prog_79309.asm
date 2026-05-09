; DESCRIPTION: Renders a yellow box of size 30x69 starting at (84, 5).
; PLAN: r0=84(x), r1=5(y), r2=30(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 5
LDI r2, 30
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
