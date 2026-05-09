; DESCRIPTION: Composite: Places a magenta circle of radius 62 at center (248, 103) then Places a purple line segment connecting (300, 64) to (301, 55) then Places a black dot at position (242, 89).
; PLAN: r0=248(x), r1=103(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x1), r6=64(y1), r7=301(x2), r8=55(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=242(x), r11=89(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 103
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 64
LDI r7, 301
LDI r8, 55
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 89
LDI r12, 0x000000
PSET r10, r11, r12
HALT
