; DESCRIPTION: Renders a black box of size 80x20 starting at (95, 163).
; PLAN: r0=95(x), r1=163(y), r2=80(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 163
LDI r2, 80
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
