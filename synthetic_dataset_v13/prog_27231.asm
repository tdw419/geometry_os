; DESCRIPTION: Composite: Renders a red disk with center (447, 54) and radius 26 then Places a yellow line segment connecting (397, 244) to (286, 207) then Sets a single yellow pixel at (308, 198).
; PLAN: r0=447(x), r1=54(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x1), r6=244(y1), r7=286(x2), r8=207(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=198(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 447
LDI r1, 54
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 244
LDI r7, 286
LDI r8, 207
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 198
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
