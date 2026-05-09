; DESCRIPTION: Composite: Draws a green rectangle at (99, 90) with width 14 and height 117 then Places a white dot at position (342, 192) then Renders a red line between points (493, 96) and (70, 220).
; PLAN: r0=99(x), r1=90(y), r2=14(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x), r6=192(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=493(x1), r11=96(y1), r12=70(x2), r13=220(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 90
LDI r2, 14
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 192
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 493
LDI r11, 96
LDI r12, 70
LDI r13, 220
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
