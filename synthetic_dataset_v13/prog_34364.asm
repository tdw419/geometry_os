; DESCRIPTION: Composite: Sets a single white pixel at (174, 187) then Draws a blue line from (68, 26) to (295, 47) then Renders a black disk with center (175, 115) and radius 16.
; PLAN: r0=174(x), r1=187(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=68(x1), r6=26(y1), r7=295(x2), r8=47(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=175(x), r11=115(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 187
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 26
LDI r7, 295
LDI r8, 47
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 115
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
