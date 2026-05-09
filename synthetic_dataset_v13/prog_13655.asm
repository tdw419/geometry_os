; DESCRIPTION: Composite: Draws a cyan circle centered at (194, 144) with radius 68 then Places a red line segment connecting (391, 47) to (431, 246) then Sets a single magenta pixel at (92, 114).
; PLAN: r0=194(x), r1=144(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x1), r6=47(y1), r7=431(x2), r8=246(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=92(x), r11=114(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 194
LDI r1, 144
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 47
LDI r7, 431
LDI r8, 246
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 114
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
