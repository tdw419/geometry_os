; DESCRIPTION: Renders a green box of size 49x117 starting at (10, 60).
; PLAN: r0=10(x), r1=60(y), r2=49(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 60
LDI r2, 49
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
