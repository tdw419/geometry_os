; DESCRIPTION: Composite: Sets a single cyan pixel at (218, 66) then Renders a magenta line between points (72, 240) and (23, 53) then Places a black circle of radius 53 at center (258, 110).
; PLAN: r0=218(x), r1=66(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=72(x1), r6=240(y1), r7=23(x2), r8=53(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=258(x), r11=110(y), r12=53(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 218
LDI r1, 66
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 240
LDI r7, 23
LDI r8, 53
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 110
LDI r12, 53
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
