; DESCRIPTION: Composite: Draws a red line from (305, 200) to (172, 2) then Draws a black circle centered at (434, 116) with radius 48 then Places a blue dot at position (270, 50).
; PLAN: r0=305(x1), r1=200(y1), r2=172(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=116(y), r7=48(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=270(x), r11=50(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 200
LDI r2, 172
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 116
LDI r7, 48
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 270
LDI r11, 50
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
