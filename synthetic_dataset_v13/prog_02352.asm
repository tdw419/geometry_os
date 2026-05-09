; DESCRIPTION: Composite: Renders a purple disk with center (113, 182) and radius 12 then Renders a blue line between points (271, 65) and (328, 217) then Places a green dot at position (466, 10).
; PLAN: r0=113(x), r1=182(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x1), r6=65(y1), r7=328(x2), r8=217(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=466(x), r11=10(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 113
LDI r1, 182
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 65
LDI r7, 328
LDI r8, 217
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 10
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
