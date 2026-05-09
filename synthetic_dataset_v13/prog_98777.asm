; DESCRIPTION: Composite: Renders a red line between points (104, 186) and (263, 190) then Places a black circle of radius 70 at center (254, 186).
; PLAN: r0=104(x1), r1=186(y1), r2=263(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=186(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 104
LDI r1, 186
LDI r2, 263
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 186
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
