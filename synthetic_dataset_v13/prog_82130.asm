; DESCRIPTION: Composite: Places a red circle of radius 37 at center (251, 115) then Places a purple line segment connecting (511, 253) to (328, 64) then Sets a single cyan pixel at (125, 46).
; PLAN: r0=251(x), r1=115(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=511(x1), r6=253(y1), r7=328(x2), r8=64(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=46(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 115
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 511
LDI r6, 253
LDI r7, 328
LDI r8, 64
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 46
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
