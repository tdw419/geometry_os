; DESCRIPTION: Draws a red rectangle at (97, 129) with width 104 and height 119.
; PLAN: r0=97(x), r1=129(y), r2=104(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 129
LDI r2, 104
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
