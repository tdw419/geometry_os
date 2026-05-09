; DESCRIPTION: Draws a yellow rectangle at (382, 129) with width 34 and height 114.
; PLAN: r0=382(x), r1=129(y), r2=34(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 129
LDI r2, 34
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
