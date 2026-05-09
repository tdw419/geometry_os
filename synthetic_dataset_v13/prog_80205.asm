; DESCRIPTION: Composite: Creates a magenta circular shape at (190, 210) with radius 35 then Renders a cyan line between points (331, 244) and (425, 115) then Sets a single cyan pixel at (355, 44).
; PLAN: r0=190(x), r1=210(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x1), r6=244(y1), r7=425(x2), r8=115(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=355(x), r11=44(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 210
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 244
LDI r7, 425
LDI r8, 115
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 44
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
