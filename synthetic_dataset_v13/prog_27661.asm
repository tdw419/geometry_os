; DESCRIPTION: Composite: Creates a magenta circular shape at (129, 208) with radius 46 then Places a cyan line segment connecting (431, 220) to (436, 94) then Sets a single cyan pixel at (222, 241).
; PLAN: r0=129(x), r1=208(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x1), r6=220(y1), r7=436(x2), r8=94(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=241(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 129
LDI r1, 208
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 220
LDI r7, 436
LDI r8, 94
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 241
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
