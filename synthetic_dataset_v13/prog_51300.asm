; DESCRIPTION: Composite: Places a purple circle of radius 44 at center (117, 136) then Renders a cyan line between points (390, 27) and (86, 137).
; PLAN: r0=117(x), r1=136(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x1), r6=27(y1), r7=86(x2), r8=137(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 136
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 27
LDI r7, 86
LDI r8, 137
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
