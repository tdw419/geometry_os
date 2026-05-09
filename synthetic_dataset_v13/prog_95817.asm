; DESCRIPTION: Composite: Renders a green disk with center (490, 52) and radius 16 then Places a white 57x110 rectangle at position (329, 95) then Places a purple dot at position (344, 119).
; PLAN: r0=490(x), r1=52(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=95(y), r7=57(width), r8=110(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=344(x), r11=119(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 490
LDI r1, 52
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 95
LDI r7, 57
LDI r8, 110
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 119
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
