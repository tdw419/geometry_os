; DESCRIPTION: Composite: Renders a yellow disk with center (167, 133) and radius 36 then Draws a white line from (374, 110) to (115, 169) then Places a red dot at position (487, 129).
; PLAN: r0=167(x), r1=133(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x1), r6=110(y1), r7=115(x2), r8=169(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=487(x), r11=129(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 133
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 110
LDI r7, 115
LDI r8, 169
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 487
LDI r11, 129
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
