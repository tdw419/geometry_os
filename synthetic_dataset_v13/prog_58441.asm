; DESCRIPTION: Draws a green rectangle at (270, 129) with width 45 and height 98.
; PLAN: r0=270(x), r1=129(y), r2=45(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 129
LDI r2, 45
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
