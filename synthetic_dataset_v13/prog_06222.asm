; DESCRIPTION: Composite: Places a green circle of radius 62 at center (305, 194) then Renders a magenta line between points (70, 139) and (503, 39) then Sets a single purple pixel at (314, 240).
; PLAN: r0=305(x), r1=194(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x1), r6=139(y1), r7=503(x2), r8=39(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=240(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 194
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 139
LDI r7, 503
LDI r8, 39
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 240
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
