; DESCRIPTION: Composite: Renders a black disk with center (292, 76) and radius 72 then Sets a single red pixel at (21, 225) then Renders a white line between points (319, 242) and (504, 70).
; PLAN: r0=292(x), r1=76(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x), r6=225(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=319(x1), r11=242(y1), r12=504(x2), r13=70(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 76
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 225
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 319
LDI r11, 242
LDI r12, 504
LDI r13, 70
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
