; DESCRIPTION: Composite: Renders a magenta line between points (146, 13) and (256, 104) then Places a blue circle of radius 20 at center (425, 21) then Places a purple dot at position (270, 139).
; PLAN: r0=146(x1), r1=13(y1), r2=256(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=21(y), r7=20(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=270(x), r11=139(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 13
LDI r2, 256
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 21
LDI r7, 20
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 270
LDI r11, 139
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
