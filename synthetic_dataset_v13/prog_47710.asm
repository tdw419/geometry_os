; DESCRIPTION: Composite: Places a yellow circle of radius 19 at center (334, 73) then Places a purple line segment connecting (487, 161) to (236, 9).
; PLAN: r0=334(x), r1=73(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x1), r6=161(y1), r7=236(x2), r8=9(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 73
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 161
LDI r7, 236
LDI r8, 9
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
