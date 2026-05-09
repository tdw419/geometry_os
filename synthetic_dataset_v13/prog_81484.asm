; DESCRIPTION: Composite: Draws a cyan line from (353, 63) to (267, 246) then Creates a red circular shape at (416, 162) with radius 72 then Sets a single blue pixel at (470, 204).
; PLAN: r0=353(x1), r1=63(y1), r2=267(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=162(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=470(x), r11=204(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 353
LDI r1, 63
LDI r2, 267
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 162
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 470
LDI r11, 204
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
