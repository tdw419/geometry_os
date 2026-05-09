; DESCRIPTION: Composite: Renders a purple line between points (383, 210) and (202, 204) then Creates a red circular shape at (160, 156) with radius 76 then Places a green dot at position (335, 40).
; PLAN: r0=383(x1), r1=210(y1), r2=202(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=156(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x), r11=40(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 383
LDI r1, 210
LDI r2, 202
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 156
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 40
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
