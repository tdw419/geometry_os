; DESCRIPTION: Composite: Draws a green line from (25, 47) to (376, 18) then Renders a cyan disk with center (152, 104) and radius 79 then Draws a purple rectangle at (104, 11) with width 20 and height 91.
; PLAN: r0=25(x1), r1=47(y1), r2=376(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=104(y), r7=79(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=11(y), r12=20(width), r13=91(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 47
LDI r2, 376
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 104
LDI r7, 79
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 11
LDI r12, 20
LDI r13, 91
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
