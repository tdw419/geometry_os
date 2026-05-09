; DESCRIPTION: Renders a black box of size 20x118 starting at (465, 103).
; PLAN: r0=465(x), r1=103(y), r2=20(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 103
LDI r2, 20
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
