; DESCRIPTION: Composite: Creates a white circular shape at (108, 45) with radius 19 then Renders a cyan box of size 104x17 starting at (178, 169) then Draws a white line from (91, 163) to (478, 42).
; PLAN: r0=108(x), r1=45(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=169(y), r7=104(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x1), r11=163(y1), r12=478(x2), r13=42(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 45
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 169
LDI r7, 104
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 163
LDI r12, 478
LDI r13, 42
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
