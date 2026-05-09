; DESCRIPTION: Composite: Draws a cyan line from (251, 225) to (440, 53) then Draws a red circle centered at (370, 104) with radius 39 then Places a yellow dot at position (423, 21).
; PLAN: r0=251(x1), r1=225(y1), r2=440(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=104(y), r7=39(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=423(x), r11=21(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 225
LDI r2, 440
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 104
LDI r7, 39
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 423
LDI r11, 21
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
