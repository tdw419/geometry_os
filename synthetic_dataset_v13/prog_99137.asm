; DESCRIPTION: Composite: Sets a single white pixel at (267, 209) then Draws a cyan circle centered at (244, 182) with radius 24 then Renders a purple line between points (308, 133) and (359, 220).
; PLAN: r0=267(x), r1=209(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=244(x), r6=182(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=308(x1), r11=133(y1), r12=359(x2), r13=220(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 209
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 244
LDI r6, 182
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 308
LDI r11, 133
LDI r12, 359
LDI r13, 220
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
