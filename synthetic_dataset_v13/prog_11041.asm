; DESCRIPTION: Composite: Draws a black rectangle at (23, 139) with width 96 and height 46 then Renders a orange line between points (418, 1) and (436, 154).
; PLAN: r0=23(x), r1=139(y), r2=96(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x1), r6=1(y1), r7=436(x2), r8=154(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 139
LDI r2, 96
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 1
LDI r7, 436
LDI r8, 154
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
