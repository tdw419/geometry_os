; DESCRIPTION: Renders a green box of size 40x37 starting at (316, 113).
; PLAN: r0=316(x), r1=113(y), r2=40(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 113
LDI r2, 40
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
