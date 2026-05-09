; DESCRIPTION: Composite: Sets a single orange pixel at (129, 44) then Draws a green rectangle at (194, 51) with width 107 and height 20 then Draws a magenta line from (298, 134) to (486, 254).
; PLAN: r0=129(x), r1=44(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=51(y), r7=107(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=298(x1), r11=134(y1), r12=486(x2), r13=254(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 44
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 194
LDI r6, 51
LDI r7, 107
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 134
LDI r12, 486
LDI r13, 254
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
