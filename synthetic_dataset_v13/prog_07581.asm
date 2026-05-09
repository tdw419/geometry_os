; DESCRIPTION: Draws a black rectangle at (402, 129) with width 22 and height 91.
; PLAN: r0=402(x), r1=129(y), r2=22(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 129
LDI r2, 22
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
