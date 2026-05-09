; DESCRIPTION: Composite: Creates a black circular shape at (379, 145) with radius 79 then Draws a yellow line from (148, 19) to (121, 228) then Sets a single white pixel at (187, 128).
; PLAN: r0=379(x), r1=145(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=148(x1), r6=19(y1), r7=121(x2), r8=228(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=128(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 379
LDI r1, 145
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 148
LDI r6, 19
LDI r7, 121
LDI r8, 228
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 128
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
