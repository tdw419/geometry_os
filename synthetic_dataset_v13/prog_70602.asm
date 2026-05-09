; DESCRIPTION: Draws a blue rectangle at (235, 129) with width 47 and height 17.
; PLAN: r0=235(x), r1=129(y), r2=47(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 129
LDI r2, 47
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
