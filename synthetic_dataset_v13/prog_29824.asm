; DESCRIPTION: Composite: Places a white circle of radius 13 at center (13, 152) then Renders a orange line between points (330, 233) and (337, 131) then Sets a single yellow pixel at (131, 227).
; PLAN: r0=13(x), r1=152(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x1), r6=233(y1), r7=337(x2), r8=131(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=131(x), r11=227(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 13
LDI r1, 152
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 233
LDI r7, 337
LDI r8, 131
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 131
LDI r11, 227
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
