; DESCRIPTION: Composite: Creates a orange circular shape at (325, 121) with radius 74 then Places a magenta line segment connecting (482, 8) to (392, 192) then Sets a single purple pixel at (464, 97).
; PLAN: r0=325(x), r1=121(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=482(x1), r6=8(y1), r7=392(x2), r8=192(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=464(x), r11=97(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 325
LDI r1, 121
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 482
LDI r6, 8
LDI r7, 392
LDI r8, 192
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 97
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
