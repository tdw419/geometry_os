; DESCRIPTION: Composite: Draws a purple circle centered at (64, 193) with radius 23 then Draws a orange line from (507, 168) to (510, 8) then Sets a single blue pixel at (150, 32).
; PLAN: r0=64(x), r1=193(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=507(x1), r6=168(y1), r7=510(x2), r8=8(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=32(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 193
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 507
LDI r6, 168
LDI r7, 510
LDI r8, 8
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 32
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
