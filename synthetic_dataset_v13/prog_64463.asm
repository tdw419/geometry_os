; DESCRIPTION: Composite: Draws a cyan circle centered at (364, 51) with radius 20 then Places a white dot at position (240, 100) then Places a red line segment connecting (350, 0) to (279, 106).
; PLAN: r0=364(x), r1=51(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=100(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=350(x1), r11=0(y1), r12=279(x2), r13=106(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 51
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 100
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 350
LDI r11, 0
LDI r12, 279
LDI r13, 106
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
