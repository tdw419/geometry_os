; DESCRIPTION: Composite: Creates a cyan circular shape at (121, 90) with radius 28 then Places a cyan dot at position (110, 104) then Places a black line segment connecting (248, 228) to (162, 233).
; PLAN: r0=121(x), r1=90(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=110(x), r6=104(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=248(x1), r11=228(y1), r12=162(x2), r13=233(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 90
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 110
LDI r6, 104
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 248
LDI r11, 228
LDI r12, 162
LDI r13, 233
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
