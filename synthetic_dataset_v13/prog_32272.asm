; DESCRIPTION: Composite: Draws a white rectangle at (423, 170) with width 10 and height 16 then Places a green dot at position (43, 71) then Places a green line segment connecting (295, 218) to (16, 13).
; PLAN: r0=423(x), r1=170(y), r2=10(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=43(x), r6=71(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=295(x1), r11=218(y1), r12=16(x2), r13=13(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 170
LDI r2, 10
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 71
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 295
LDI r11, 218
LDI r12, 16
LDI r13, 13
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
