; DESCRIPTION: Composite: Places a green 24x113 rectangle at position (314, 41) then Places a white line segment connecting (327, 178) to (130, 31) then Renders a cyan disk with center (137, 170) and radius 30.
; PLAN: r0=314(x), r1=41(y), r2=24(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x1), r6=178(y1), r7=130(x2), r8=31(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=170(y), r12=30(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 314
LDI r1, 41
LDI r2, 24
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 178
LDI r7, 130
LDI r8, 31
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 170
LDI r12, 30
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
