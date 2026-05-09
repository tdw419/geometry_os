; DESCRIPTION: Composite: Draws a purple circle centered at (80, 81) with radius 61 then Sets a single magenta pixel at (178, 146) then Renders a yellow line between points (59, 13) and (218, 41).
; PLAN: r0=80(x), r1=81(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=146(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=59(x1), r11=13(y1), r12=218(x2), r13=41(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 81
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 146
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 59
LDI r11, 13
LDI r12, 218
LDI r13, 41
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
