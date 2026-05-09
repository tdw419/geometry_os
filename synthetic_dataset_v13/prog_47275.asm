; DESCRIPTION: Composite: Places a cyan line segment connecting (200, 136) to (197, 233) then Sets a single yellow pixel at (198, 221) then Renders a yellow disk with center (158, 198) and radius 47.
; PLAN: r0=200(x1), r1=136(y1), r2=197(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=221(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=198(y), r12=47(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 200
LDI r1, 136
LDI r2, 197
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 221
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 158
LDI r11, 198
LDI r12, 47
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
