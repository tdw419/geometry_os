; DESCRIPTION: Composite: Places a cyan dot at position (229, 154) then Renders a red disk with center (324, 141) and radius 65 then Places a cyan line segment connecting (18, 49) to (475, 133).
; PLAN: r0=229(x), r1=154(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=141(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x1), r11=49(y1), r12=475(x2), r13=133(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 154
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 324
LDI r6, 141
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 49
LDI r12, 475
LDI r13, 133
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
