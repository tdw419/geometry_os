; DESCRIPTION: Draws a orange rectangle at (366, 129) with width 35 and height 68.
; PLAN: r0=366(x), r1=129(y), r2=35(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 129
LDI r2, 35
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
