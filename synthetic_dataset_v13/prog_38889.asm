; DESCRIPTION: Composite: Renders a green disk with center (127, 100) and radius 42 then Sets a single green pixel at (419, 122) then Places a red line segment connecting (130, 190) to (57, 142).
; PLAN: r0=127(x), r1=100(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=122(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=130(x1), r11=190(y1), r12=57(x2), r13=142(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 100
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 122
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 130
LDI r11, 190
LDI r12, 57
LDI r13, 142
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
