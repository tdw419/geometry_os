; DESCRIPTION: Composite: Sets a single white pixel at (253, 145) then Places a black circle of radius 75 at center (387, 141) then Draws a green line from (510, 186) to (82, 178).
; PLAN: r0=253(x), r1=145(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=141(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=510(x1), r11=186(y1), r12=82(x2), r13=178(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 145
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 387
LDI r6, 141
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 510
LDI r11, 186
LDI r12, 82
LDI r13, 178
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
