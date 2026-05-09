; DESCRIPTION: Composite: Places a purple circle of radius 68 at center (207, 104) then Draws a red line from (38, 1) to (227, 14) then Places a cyan dot at position (406, 100).
; PLAN: r0=207(x), r1=104(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x1), r6=1(y1), r7=227(x2), r8=14(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=100(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 207
LDI r1, 104
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 1
LDI r7, 227
LDI r8, 14
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 100
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
