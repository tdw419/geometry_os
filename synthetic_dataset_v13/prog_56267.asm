; DESCRIPTION: Composite: Sets a single green pixel at (327, 72) then Draws a white line from (392, 201) to (498, 233) then Draws a magenta circle centered at (231, 34) with radius 30.
; PLAN: r0=327(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=392(x1), r6=201(y1), r7=498(x2), r8=233(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=231(x), r11=34(y), r12=30(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 327
LDI r1, 72
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 392
LDI r6, 201
LDI r7, 498
LDI r8, 233
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 34
LDI r12, 30
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
