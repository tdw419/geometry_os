; DESCRIPTION: Composite: Renders a cyan line between points (115, 193) and (344, 126) then Places a purple dot at position (241, 57) then Renders a white disk with center (301, 74) and radius 61.
; PLAN: r0=115(x1), r1=193(y1), r2=344(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=57(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=301(x), r11=74(y), r12=61(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 115
LDI r1, 193
LDI r2, 344
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 57
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 301
LDI r11, 74
LDI r12, 61
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
