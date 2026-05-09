; DESCRIPTION: Composite: Draws a yellow line from (202, 25) to (95, 251) then Places a purple circle of radius 46 at center (154, 186) then Sets a single orange pixel at (373, 146).
; PLAN: r0=202(x1), r1=25(y1), r2=95(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=186(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x), r11=146(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 202
LDI r1, 25
LDI r2, 95
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 186
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 146
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
