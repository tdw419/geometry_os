; DESCRIPTION: Composite: Draws a magenta line from (398, 162) to (464, 62) then Renders a purple disk with center (295, 94) and radius 48 then Places a red dot at position (17, 241).
; PLAN: r0=398(x1), r1=162(y1), r2=464(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=94(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=17(x), r11=241(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 398
LDI r1, 162
LDI r2, 464
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 94
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 17
LDI r11, 241
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
