; DESCRIPTION: Composite: Draws a white line from (105, 46) to (290, 182) then Places a magenta dot at position (0, 40) then Draws a yellow circle centered at (220, 125) with radius 57.
; PLAN: r0=105(x1), r1=46(y1), r2=290(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=40(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=220(x), r11=125(y), r12=57(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 46
LDI r2, 290
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 40
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 125
LDI r12, 57
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
