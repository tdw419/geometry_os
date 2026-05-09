; DESCRIPTION: Draws a white rectangle at (318, 129) with width 116 and height 17.
; PLAN: r0=318(x), r1=129(y), r2=116(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 129
LDI r2, 116
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
