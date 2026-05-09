; DESCRIPTION: Composite: Draws a black line from (280, 61) to (511, 248) then Draws a magenta circle centered at (70, 79) with radius 70 then Sets a single white pixel at (52, 207).
; PLAN: r0=280(x1), r1=61(y1), r2=511(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=70(x), r6=79(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x), r11=207(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 280
LDI r1, 61
LDI r2, 511
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 79
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 207
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
