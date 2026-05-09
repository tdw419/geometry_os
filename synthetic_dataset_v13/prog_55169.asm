; DESCRIPTION: Draws a yellow rectangle at (207, 129) with width 41 and height 80.
; PLAN: r0=207(x), r1=129(y), r2=41(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 129
LDI r2, 41
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
