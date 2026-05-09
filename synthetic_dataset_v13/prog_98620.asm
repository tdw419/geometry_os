; DESCRIPTION: Composite: Creates a cyan circular shape at (393, 175) with radius 39 then Sets a single green pixel at (237, 182) then Renders a purple line between points (31, 230) and (81, 190).
; PLAN: r0=393(x), r1=175(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=182(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=31(x1), r11=230(y1), r12=81(x2), r13=190(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 175
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 182
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 31
LDI r11, 230
LDI r12, 81
LDI r13, 190
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
