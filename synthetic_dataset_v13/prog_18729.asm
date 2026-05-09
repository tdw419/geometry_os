; DESCRIPTION: Composite: Places a white dot at position (267, 229) then Places a purple line segment connecting (183, 221) to (65, 151) then Renders a blue disk with center (295, 146) and radius 53.
; PLAN: r0=267(x), r1=229(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=183(x1), r6=221(y1), r7=65(x2), r8=151(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=295(x), r11=146(y), r12=53(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 267
LDI r1, 229
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 183
LDI r6, 221
LDI r7, 65
LDI r8, 151
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 146
LDI r12, 53
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
