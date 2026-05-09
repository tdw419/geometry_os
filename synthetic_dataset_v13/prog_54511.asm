; DESCRIPTION: Composite: Renders a yellow line between points (408, 173) and (440, 117) then Renders a red disk with center (393, 72) and radius 10 then Sets a single orange pixel at (8, 22).
; PLAN: r0=408(x1), r1=173(y1), r2=440(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=72(y), r7=10(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x), r11=22(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 408
LDI r1, 173
LDI r2, 440
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 72
LDI r7, 10
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 22
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
