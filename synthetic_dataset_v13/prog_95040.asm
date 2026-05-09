; DESCRIPTION: Draws a green rectangle at (60, 129) with width 50 and height 104.
; PLAN: r0=60(x), r1=129(y), r2=50(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 129
LDI r2, 50
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
