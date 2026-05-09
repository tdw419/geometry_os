; DESCRIPTION: Composite: Renders a black line between points (346, 223) and (400, 13) then Renders a white box of size 64x23 starting at (8, 104) then Sets a single yellow pixel at (219, 157).
; PLAN: r0=346(x1), r1=223(y1), r2=400(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=8(x), r6=104(y), r7=64(width), r8=23(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x), r11=157(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 223
LDI r2, 400
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 8
LDI r6, 104
LDI r7, 64
LDI r8, 23
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 157
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
