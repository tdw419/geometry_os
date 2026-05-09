; DESCRIPTION: Composite: Places a black line segment connecting (193, 58) to (490, 50) then Creates a white circular shape at (377, 149) with radius 48 then Places a green dot at position (121, 219).
; PLAN: r0=193(x1), r1=58(y1), r2=490(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=149(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=121(x), r11=219(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 58
LDI r2, 490
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 149
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 121
LDI r11, 219
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
