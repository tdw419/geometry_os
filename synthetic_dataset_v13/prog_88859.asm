; DESCRIPTION: Composite: Places a black circle of radius 14 at center (50, 142) then Places a purple line segment connecting (398, 253) to (275, 79).
; PLAN: r0=50(x), r1=142(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x1), r6=253(y1), r7=275(x2), r8=79(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 142
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 253
LDI r7, 275
LDI r8, 79
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
