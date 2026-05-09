; DESCRIPTION: Composite: Draws a white line from (507, 39) to (137, 129) then Draws a magenta circle centered at (259, 158) with radius 32 then Sets a single cyan pixel at (371, 123).
; PLAN: r0=507(x1), r1=39(y1), r2=137(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=158(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=371(x), r11=123(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 507
LDI r1, 39
LDI r2, 137
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 158
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 371
LDI r11, 123
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
