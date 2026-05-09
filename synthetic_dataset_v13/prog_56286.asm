; DESCRIPTION: Composite: Places a green circle of radius 45 at center (346, 118) then Sets a single magenta pixel at (295, 41) then Renders a white line between points (276, 161) and (74, 59).
; PLAN: r0=346(x), r1=118(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=41(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=276(x1), r11=161(y1), r12=74(x2), r13=59(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 118
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 41
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 276
LDI r11, 161
LDI r12, 74
LDI r13, 59
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
