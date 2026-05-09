; DESCRIPTION: Composite: Renders a red disk with center (90, 103) and radius 74 then Renders a green line between points (21, 176) and (266, 18) then Sets a single magenta pixel at (122, 149).
; PLAN: r0=90(x), r1=103(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x1), r6=176(y1), r7=266(x2), r8=18(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=122(x), r11=149(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 90
LDI r1, 103
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 176
LDI r7, 266
LDI r8, 18
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 149
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
