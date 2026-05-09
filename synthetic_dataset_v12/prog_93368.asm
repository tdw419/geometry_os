; DESCRIPTION: Composite: Places a purple 103x108 rectangle at position (233, 147) then Places a cyan line segment connecting (8, 68) to (3, 172) then Sets a single blue pixel at (337, 241).
; PLAN: r0=233(x), r1=147(y), r2=103(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=8(x1), r6=68(y1), r7=3(x2), r8=172(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=337(x), r11=241(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 233
LDI r1, 147
LDI r2, 103
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 8
LDI r6, 68
LDI r7, 3
LDI r8, 172
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 241
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
