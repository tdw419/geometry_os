; DESCRIPTION: Composite: Draws a blue circle centered at (364, 84) with radius 66 then Places a black line segment connecting (205, 170) to (392, 27) then Places a blue dot at position (434, 242).
; PLAN: r0=364(x), r1=84(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x1), r6=170(y1), r7=392(x2), r8=27(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=242(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 364
LDI r1, 84
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 170
LDI r7, 392
LDI r8, 27
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 242
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
