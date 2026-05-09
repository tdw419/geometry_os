; DESCRIPTION: Renders a green box of size 111x117 starting at (88, 84).
; PLAN: r0=88(x), r1=84(y), r2=111(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 84
LDI r2, 111
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
