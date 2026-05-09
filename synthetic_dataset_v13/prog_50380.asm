; DESCRIPTION: Composite: Creates a blue circular shape at (424, 125) with radius 22 then Places a cyan line segment connecting (176, 199) to (55, 182) then Places a purple dot at position (392, 50).
; PLAN: r0=424(x), r1=125(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x1), r6=199(y1), r7=55(x2), r8=182(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=50(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 125
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 199
LDI r7, 55
LDI r8, 182
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 50
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
