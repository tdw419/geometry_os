; DESCRIPTION: Composite: Draws a white circle centered at (380, 124) with radius 71 then Sets a single green pixel at (194, 154) then Renders a red line between points (220, 70) and (486, 130).
; PLAN: r0=380(x), r1=124(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=154(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=220(x1), r11=70(y1), r12=486(x2), r13=130(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 124
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 154
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 220
LDI r11, 70
LDI r12, 486
LDI r13, 130
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
