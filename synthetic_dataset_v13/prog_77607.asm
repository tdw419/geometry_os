; DESCRIPTION: Composite: Places a white circle of radius 33 at center (297, 120) then Sets a single purple pixel at (458, 176) then Renders a red line between points (65, 163) and (296, 128).
; PLAN: r0=297(x), r1=120(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=458(x), r6=176(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=65(x1), r11=163(y1), r12=296(x2), r13=128(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 120
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 458
LDI r6, 176
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 65
LDI r11, 163
LDI r12, 296
LDI r13, 128
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
