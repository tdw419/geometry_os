; DESCRIPTION: Composite: Renders a red line between points (308, 159) and (10, 122) then Places a green dot at position (242, 251) then Renders a magenta disk with center (448, 73) and radius 12.
; PLAN: r0=308(x1), r1=159(y1), r2=10(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=251(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=448(x), r11=73(y), r12=12(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 159
LDI r2, 10
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 251
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 448
LDI r11, 73
LDI r12, 12
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
