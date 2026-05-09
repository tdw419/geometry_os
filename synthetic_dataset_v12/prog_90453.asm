; DESCRIPTION: Composite: Creates a black circular shape at (190, 223) with radius 18 then Places a cyan line segment connecting (162, 65) to (232, 164).
; PLAN: r0=190(x), r1=223(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x1), r6=65(y1), r7=232(x2), r8=164(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 223
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 65
LDI r7, 232
LDI r8, 164
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
