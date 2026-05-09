; DESCRIPTION: Draws a black rectangle at (227, 129) with width 70 and height 32.
; PLAN: r0=227(x), r1=129(y), r2=70(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 129
LDI r2, 70
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
