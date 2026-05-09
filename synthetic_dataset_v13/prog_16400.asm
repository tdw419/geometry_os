; DESCRIPTION: Composite: Draws a black circle centered at (328, 153) with radius 76 then Places a blue line segment connecting (0, 87) to (247, 242) then Sets a single cyan pixel at (79, 143).
; PLAN: r0=328(x), r1=153(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x1), r6=87(y1), r7=247(x2), r8=242(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=79(x), r11=143(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 328
LDI r1, 153
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 87
LDI r7, 247
LDI r8, 242
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 79
LDI r11, 143
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
