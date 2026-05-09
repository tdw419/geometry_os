; DESCRIPTION: Composite: Creates a white circular shape at (448, 119) with radius 60 then Sets a single cyan pixel at (466, 96) then Places a blue line segment connecting (308, 251) to (371, 38).
; PLAN: r0=448(x), r1=119(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=96(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=308(x1), r11=251(y1), r12=371(x2), r13=38(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 119
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 96
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 308
LDI r11, 251
LDI r12, 371
LDI r13, 38
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
