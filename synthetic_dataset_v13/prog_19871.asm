; DESCRIPTION: Composite: Places a cyan circle of radius 76 at center (332, 94) then Draws a white rectangle at (83, 193) with width 68 and height 42 then Places a green line segment connecting (182, 158) to (352, 7).
; PLAN: r0=332(x), r1=94(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=193(y), r7=68(width), r8=42(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=182(x1), r11=158(y1), r12=352(x2), r13=7(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 94
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 193
LDI r7, 68
LDI r8, 42
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 158
LDI r12, 352
LDI r13, 7
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
