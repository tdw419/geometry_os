; DESCRIPTION: Composite: Sets a single green pixel at (344, 30) then Places a blue circle of radius 79 at center (275, 80) then Renders a magenta line between points (492, 115) and (456, 121).
; PLAN: r0=344(x), r1=30(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=80(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=492(x1), r11=115(y1), r12=456(x2), r13=121(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 30
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 275
LDI r6, 80
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 492
LDI r11, 115
LDI r12, 456
LDI r13, 121
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
