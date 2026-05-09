; DESCRIPTION: Composite: Draws a green circle centered at (112, 66) with radius 57 then Sets a single orange pixel at (372, 248) then Renders a magenta line between points (290, 202) and (16, 75).
; PLAN: r0=112(x), r1=66(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=248(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=290(x1), r11=202(y1), r12=16(x2), r13=75(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 66
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 248
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 290
LDI r11, 202
LDI r12, 16
LDI r13, 75
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
