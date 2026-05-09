; DESCRIPTION: Composite: Creates a cyan rectangular region at (40, 89) spanning 40 by 35 pixels then Renders a blue line between points (357, 62) and (225, 136) then Places a purple dot at position (366, 107).
; PLAN: r0=40(x), r1=89(y), r2=40(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x1), r6=62(y1), r7=225(x2), r8=136(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=107(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 40
LDI r1, 89
LDI r2, 40
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 62
LDI r7, 225
LDI r8, 136
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 107
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
