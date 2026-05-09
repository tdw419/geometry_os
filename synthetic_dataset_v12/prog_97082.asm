; DESCRIPTION: Composite: Places a black circle of radius 48 at center (395, 134) then Places a black line segment connecting (207, 226) to (266, 70).
; PLAN: r0=395(x), r1=134(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x1), r6=226(y1), r7=266(x2), r8=70(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 134
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 226
LDI r7, 266
LDI r8, 70
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
