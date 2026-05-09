; DESCRIPTION: Composite: Creates a blue circular shape at (251, 62) with radius 62 then Places a cyan line segment connecting (309, 152) to (191, 233) then Sets a single red pixel at (508, 219).
; PLAN: r0=251(x), r1=62(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x1), r6=152(y1), r7=191(x2), r8=233(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=508(x), r11=219(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 62
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 152
LDI r7, 191
LDI r8, 233
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 508
LDI r11, 219
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
