; DESCRIPTION: Composite: Draws a yellow line from (139, 42) to (475, 120) then Draws a cyan circle centered at (66, 118) with radius 27 then Sets a single blue pixel at (379, 128).
; PLAN: r0=139(x1), r1=42(y1), r2=475(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=118(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=379(x), r11=128(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 42
LDI r2, 475
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 118
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 379
LDI r11, 128
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
