; DESCRIPTION: Composite: Creates a blue circular shape at (316, 182) with radius 27 then Sets a single white pixel at (264, 12) then Renders a white line between points (133, 206) and (64, 195).
; PLAN: r0=316(x), r1=182(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x), r6=12(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=133(x1), r11=206(y1), r12=64(x2), r13=195(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 182
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 12
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 133
LDI r11, 206
LDI r12, 64
LDI r13, 195
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
