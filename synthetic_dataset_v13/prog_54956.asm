; DESCRIPTION: Composite: Places a black circle of radius 43 at center (330, 207) then Places a white 82x79 rectangle at position (26, 174) then Places a black line segment connecting (370, 111) to (170, 236).
; PLAN: r0=330(x), r1=207(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x), r6=174(y), r7=82(width), r8=79(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x1), r11=111(y1), r12=170(x2), r13=236(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 207
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 174
LDI r7, 82
LDI r8, 79
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 111
LDI r12, 170
LDI r13, 236
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
