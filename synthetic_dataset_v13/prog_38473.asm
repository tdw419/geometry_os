; DESCRIPTION: Draws a white rectangle at (235, 129) with width 106 and height 104.
; PLAN: r0=235(x), r1=129(y), r2=106(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 129
LDI r2, 106
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
