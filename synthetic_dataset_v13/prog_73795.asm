; DESCRIPTION: Composite: Renders a green disk with center (145, 142) and radius 58 then Renders a cyan line between points (386, 200) and (90, 162) then Sets a single white pixel at (22, 80).
; PLAN: r0=145(x), r1=142(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x1), r6=200(y1), r7=90(x2), r8=162(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=22(x), r11=80(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 142
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 200
LDI r7, 90
LDI r8, 162
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 80
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
