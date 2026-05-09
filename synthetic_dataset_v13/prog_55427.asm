; DESCRIPTION: Composite: Places a cyan circle of radius 21 at center (237, 205) then Draws a orange rectangle at (20, 21) with width 98 and height 74 then Places a white line segment connecting (9, 78) to (468, 119).
; PLAN: r0=237(x), r1=205(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=21(y), r7=98(width), r8=74(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=9(x1), r11=78(y1), r12=468(x2), r13=119(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 205
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 21
LDI r7, 98
LDI r8, 74
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 9
LDI r11, 78
LDI r12, 468
LDI r13, 119
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
