; DESCRIPTION: Composite: Renders a black line between points (164, 190) and (434, 59) then Renders a blue disk with center (136, 109) and radius 57 then Places a orange dot at position (296, 68).
; PLAN: r0=164(x1), r1=190(y1), r2=434(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=136(x), r6=109(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=296(x), r11=68(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 190
LDI r2, 434
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 109
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 296
LDI r11, 68
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
