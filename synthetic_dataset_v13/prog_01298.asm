; DESCRIPTION: Composite: Draws a yellow circle centered at (392, 93) with radius 65 then Sets a single red pixel at (80, 28) then Renders a green line between points (465, 91) and (278, 137).
; PLAN: r0=392(x), r1=93(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=28(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=465(x1), r11=91(y1), r12=278(x2), r13=137(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 93
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 28
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 465
LDI r11, 91
LDI r12, 278
LDI r13, 137
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
