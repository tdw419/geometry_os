; DESCRIPTION: Composite: Renders a white line between points (255, 53) and (122, 93) then Places a cyan dot at position (144, 250) then Renders a magenta disk with center (116, 158) and radius 34.
; PLAN: r0=255(x1), r1=53(y1), r2=122(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=250(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=116(x), r11=158(y), r12=34(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 255
LDI r1, 53
LDI r2, 122
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 250
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 116
LDI r11, 158
LDI r12, 34
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
