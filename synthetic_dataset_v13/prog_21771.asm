; DESCRIPTION: Composite: Draws a orange circle centered at (102, 149) with radius 56 then Draws a orange line from (175, 208) to (469, 57) then Sets a single cyan pixel at (273, 29).
; PLAN: r0=102(x), r1=149(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x1), r6=208(y1), r7=469(x2), r8=57(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=273(x), r11=29(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 102
LDI r1, 149
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 208
LDI r7, 469
LDI r8, 57
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 29
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
