; DESCRIPTION: Composite: Places a magenta circle of radius 29 at center (285, 116) then Renders a magenta line between points (391, 161) and (405, 47) then Sets a single black pixel at (380, 129).
; PLAN: r0=285(x), r1=116(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x1), r6=161(y1), r7=405(x2), r8=47(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=129(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 116
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 161
LDI r7, 405
LDI r8, 47
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 129
LDI r12, 0x000000
PSET r10, r11, r12
HALT
