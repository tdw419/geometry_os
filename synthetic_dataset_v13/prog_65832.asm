; DESCRIPTION: Composite: Places a white dot at position (252, 29) then Renders a yellow disk with center (277, 187) and radius 35 then Renders a red line between points (75, 189) and (176, 197).
; PLAN: r0=252(x), r1=29(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=187(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=75(x1), r11=189(y1), r12=176(x2), r13=197(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 29
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 277
LDI r6, 187
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 75
LDI r11, 189
LDI r12, 176
LDI r13, 197
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
