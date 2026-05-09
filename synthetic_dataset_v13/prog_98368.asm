; DESCRIPTION: Composite: Places a yellow circle of radius 41 at center (198, 53) then Places a black line segment connecting (436, 109) to (29, 152).
; PLAN: r0=198(x), r1=53(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x1), r6=109(y1), r7=29(x2), r8=152(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 53
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 109
LDI r7, 29
LDI r8, 152
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
