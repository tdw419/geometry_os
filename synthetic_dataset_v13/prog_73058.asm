; DESCRIPTION: Composite: Places a green dot at position (222, 124) then Places a blue 25x65 rectangle at position (333, 92) then Places a yellow line segment connecting (378, 2) to (306, 35).
; PLAN: r0=222(x), r1=124(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=333(x), r6=92(y), r7=25(width), r8=65(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x1), r11=2(y1), r12=306(x2), r13=35(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 124
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 333
LDI r6, 92
LDI r7, 25
LDI r8, 65
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 2
LDI r12, 306
LDI r13, 35
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
