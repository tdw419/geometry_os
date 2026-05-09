; DESCRIPTION: Composite: Draws a blue circle centered at (143, 160) with radius 74 then Sets a single white pixel at (150, 2) then Draws a magenta line from (406, 143) to (19, 14).
; PLAN: r0=143(x), r1=160(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=2(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=406(x1), r11=143(y1), r12=19(x2), r13=14(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 160
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 2
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 406
LDI r11, 143
LDI r12, 19
LDI r13, 14
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
