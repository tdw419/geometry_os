; DESCRIPTION: Draws a green rectangle at (358, 129) with width 24 and height 116.
; PLAN: r0=358(x), r1=129(y), r2=24(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 129
LDI r2, 24
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
