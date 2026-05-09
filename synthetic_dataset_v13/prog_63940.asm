; DESCRIPTION: Composite: Draws a white line from (391, 28) to (395, 223) then Places a yellow circle of radius 31 at center (95, 217).
; PLAN: r0=391(x1), r1=28(y1), r2=395(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=217(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 28
LDI r2, 395
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 217
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
