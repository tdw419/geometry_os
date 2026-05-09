; DESCRIPTION: Composite: Renders a magenta disk with center (438, 90) and radius 24 then Renders a blue line between points (460, 54) and (377, 28) then Sets a single cyan pixel at (131, 226).
; PLAN: r0=438(x), r1=90(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x1), r6=54(y1), r7=377(x2), r8=28(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=226(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 438
LDI r1, 90
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 54
LDI r7, 377
LDI r8, 28
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 226
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
