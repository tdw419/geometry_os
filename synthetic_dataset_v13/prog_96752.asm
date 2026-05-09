; DESCRIPTION: Draws a green rectangle at (316, 129) with width 44 and height 68.
; PLAN: r0=316(x), r1=129(y), r2=44(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 129
LDI r2, 44
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
