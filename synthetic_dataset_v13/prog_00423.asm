; DESCRIPTION: Composite: Draws a cyan circle centered at (300, 185) with radius 22 then Draws a red line from (262, 108) to (449, 66) then Places a yellow dot at position (69, 201).
; PLAN: r0=300(x), r1=185(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x1), r6=108(y1), r7=449(x2), r8=66(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=201(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 300
LDI r1, 185
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 108
LDI r7, 449
LDI r8, 66
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 201
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
