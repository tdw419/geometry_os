; DESCRIPTION: Composite: Places a yellow line segment connecting (277, 179) to (450, 196) then Draws a yellow circle centered at (357, 58) with radius 48 then Sets a single black pixel at (123, 46).
; PLAN: r0=277(x1), r1=179(y1), r2=450(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=357(x), r6=58(y), r7=48(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x), r11=46(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 277
LDI r1, 179
LDI r2, 450
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 58
LDI r7, 48
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 46
LDI r12, 0x000000
PSET r10, r11, r12
HALT
