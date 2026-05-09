; DESCRIPTION: Composite: Creates a cyan circular shape at (151, 182) with radius 12 then Renders a yellow line between points (222, 134) and (417, 178) then Places a cyan dot at position (358, 117).
; PLAN: r0=151(x), r1=182(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x1), r6=134(y1), r7=417(x2), r8=178(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=117(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 151
LDI r1, 182
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 134
LDI r7, 417
LDI r8, 178
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 117
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
