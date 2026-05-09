; DESCRIPTION: Composite: Sets a single red pixel at (247, 19) then Places a white line segment connecting (0, 44) to (468, 231) then Draws a magenta rectangle at (185, 142) with width 111 and height 80.
; PLAN: r0=247(x), r1=19(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=0(x1), r6=44(y1), r7=468(x2), r8=231(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=185(x), r11=142(y), r12=111(width), r13=80(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 19
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 0
LDI r6, 44
LDI r7, 468
LDI r8, 231
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 142
LDI r12, 111
LDI r13, 80
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
