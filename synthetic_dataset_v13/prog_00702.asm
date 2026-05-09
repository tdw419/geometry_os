; DESCRIPTION: Composite: Sets a single orange pixel at (471, 41) then Draws a cyan circle centered at (374, 139) with radius 64 then Places a red line segment connecting (369, 150) to (80, 57).
; PLAN: r0=471(x), r1=41(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=139(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=369(x1), r11=150(y1), r12=80(x2), r13=57(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 41
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 374
LDI r6, 139
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 369
LDI r11, 150
LDI r12, 80
LDI r13, 57
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
