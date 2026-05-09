; DESCRIPTION: Composite: Places a yellow dot at position (66, 141) then Renders a red disk with center (127, 135) and radius 19 then Draws a white line from (290, 14) to (448, 85).
; PLAN: r0=66(x), r1=141(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=135(y), r7=19(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=290(x1), r11=14(y1), r12=448(x2), r13=85(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 141
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 127
LDI r6, 135
LDI r7, 19
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 290
LDI r11, 14
LDI r12, 448
LDI r13, 85
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
