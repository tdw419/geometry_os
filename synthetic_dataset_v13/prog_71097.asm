; DESCRIPTION: Composite: Renders a orange disk with center (307, 119) and radius 54 then Places a cyan line segment connecting (6, 18) to (370, 247) then Draws a orange rectangle at (169, 27) with width 29 and height 10.
; PLAN: r0=307(x), r1=119(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x1), r6=18(y1), r7=370(x2), r8=247(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=169(x), r11=27(y), r12=29(width), r13=10(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 119
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 18
LDI r7, 370
LDI r8, 247
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 27
LDI r12, 29
LDI r13, 10
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
