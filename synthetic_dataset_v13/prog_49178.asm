; DESCRIPTION: Renders a blue box of size 94x14 starting at (316, 202).
; PLAN: r0=316(x), r1=202(y), r2=94(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 202
LDI r2, 94
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
