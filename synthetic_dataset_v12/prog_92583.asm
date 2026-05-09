; DESCRIPTION: Composite: Draws a black rectangle at (255, 20) with width 48 and height 54 then Places a green dot at position (459, 130).
; PLAN: r0=255(x), r1=20(y), r2=48(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=130(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 20
LDI r2, 48
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 130
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
