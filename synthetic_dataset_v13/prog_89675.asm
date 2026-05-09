; DESCRIPTION: Composite: Renders a red line between points (190, 188) and (245, 186) then Renders a yellow disk with center (403, 150) and radius 20 then Places a green dot at position (100, 10).
; PLAN: r0=190(x1), r1=188(y1), r2=245(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=150(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x), r11=10(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 188
LDI r2, 245
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 150
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 10
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
