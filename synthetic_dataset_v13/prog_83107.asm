; DESCRIPTION: Composite: Places a yellow dot at position (1, 9) then Draws a orange rectangle at (75, 86) with width 80 and height 81 then Draws a purple line from (251, 204) to (493, 118).
; PLAN: r0=1(x), r1=9(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=86(y), r7=80(width), r8=81(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=251(x1), r11=204(y1), r12=493(x2), r13=118(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 9
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 75
LDI r6, 86
LDI r7, 80
LDI r8, 81
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 204
LDI r12, 493
LDI r13, 118
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
