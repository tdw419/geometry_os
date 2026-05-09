; DESCRIPTION: Composite: Renders a blue line between points (380, 251) and (171, 99) then Sets a single green pixel at (371, 108) then Creates a red circular shape at (433, 190) with radius 60.
; PLAN: r0=380(x1), r1=251(y1), r2=171(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=371(x), r6=108(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=433(x), r11=190(y), r12=60(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 380
LDI r1, 251
LDI r2, 171
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 108
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 433
LDI r11, 190
LDI r12, 60
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
