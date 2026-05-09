; DESCRIPTION: Composite: Draws a black line from (404, 130) to (366, 33) then Renders a yellow box of size 37x105 starting at (468, 23) then Places a white dot at position (222, 143).
; PLAN: r0=404(x1), r1=130(y1), r2=366(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=23(y), r7=37(width), r8=105(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=222(x), r11=143(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 130
LDI r2, 366
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 23
LDI r7, 37
LDI r8, 105
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 143
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
