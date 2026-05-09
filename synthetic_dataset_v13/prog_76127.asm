; DESCRIPTION: Composite: Sets a single white pixel at (160, 149) then Places a red line segment connecting (38, 102) to (80, 18) then Creates a green circular shape at (305, 167) with radius 52.
; PLAN: r0=160(x), r1=149(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=38(x1), r6=102(y1), r7=80(x2), r8=18(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=167(y), r12=52(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 160
LDI r1, 149
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 38
LDI r6, 102
LDI r7, 80
LDI r8, 18
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 167
LDI r12, 52
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
