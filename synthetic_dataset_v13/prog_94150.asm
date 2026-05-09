; DESCRIPTION: Draws a white rectangle at (69, 129) with width 63 and height 114.
; PLAN: r0=69(x), r1=129(y), r2=63(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 129
LDI r2, 63
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
