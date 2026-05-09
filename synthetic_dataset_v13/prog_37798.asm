; DESCRIPTION: Composite: Places a white 117x57 rectangle at position (122, 90) then Draws a yellow line from (275, 7) to (49, 200) then Places a green circle of radius 37 at center (63, 162).
; PLAN: r0=122(x), r1=90(y), r2=117(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x1), r6=7(y1), r7=49(x2), r8=200(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=63(x), r11=162(y), r12=37(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 90
LDI r2, 117
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 7
LDI r7, 49
LDI r8, 200
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 162
LDI r12, 37
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
