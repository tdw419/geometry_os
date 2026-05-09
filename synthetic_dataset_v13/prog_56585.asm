; DESCRIPTION: Composite: Places a blue circle of radius 12 at center (416, 197) then Places a cyan line segment connecting (470, 60) to (81, 110) then Sets a single blue pixel at (360, 128).
; PLAN: r0=416(x), r1=197(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=470(x1), r6=60(y1), r7=81(x2), r8=110(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=128(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 416
LDI r1, 197
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 470
LDI r6, 60
LDI r7, 81
LDI r8, 110
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 128
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
