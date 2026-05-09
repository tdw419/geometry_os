; DESCRIPTION: Composite: Draws a orange rectangle at (48, 152) with width 21 and height 26 then Places a magenta line segment connecting (34, 49) to (510, 36) then Draws a orange circle centered at (380, 50) with radius 37.
; PLAN: r0=48(x), r1=152(y), r2=21(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x1), r6=49(y1), r7=510(x2), r8=36(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=50(y), r12=37(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 48
LDI r1, 152
LDI r2, 21
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 49
LDI r7, 510
LDI r8, 36
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 50
LDI r12, 37
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
