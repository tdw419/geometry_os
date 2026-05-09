; DESCRIPTION: Composite: Renders a white line between points (398, 100) and (192, 182) then Renders a red disk with center (221, 75) and radius 61 then Sets a single green pixel at (20, 38).
; PLAN: r0=398(x1), r1=100(y1), r2=192(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=75(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=20(x), r11=38(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 398
LDI r1, 100
LDI r2, 192
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 75
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 20
LDI r11, 38
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
