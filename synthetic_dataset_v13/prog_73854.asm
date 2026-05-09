; DESCRIPTION: Composite: Draws a yellow line from (215, 129) to (35, 169) then Places a orange circle of radius 34 at center (455, 44) then Sets a single purple pixel at (410, 57).
; PLAN: r0=215(x1), r1=129(y1), r2=35(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=44(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=410(x), r11=57(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 215
LDI r1, 129
LDI r2, 35
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 44
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 410
LDI r11, 57
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
