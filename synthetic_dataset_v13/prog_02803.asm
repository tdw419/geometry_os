; DESCRIPTION: Composite: Sets a single orange pixel at (23, 0) then Places a cyan line segment connecting (71, 13) to (410, 104) then Draws a black circle centered at (271, 133) with radius 67.
; PLAN: r0=23(x), r1=0(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=71(x1), r6=13(y1), r7=410(x2), r8=104(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=133(y), r12=67(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 23
LDI r1, 0
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 71
LDI r6, 13
LDI r7, 410
LDI r8, 104
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 133
LDI r12, 67
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
