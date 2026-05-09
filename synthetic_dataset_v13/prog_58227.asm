; DESCRIPTION: Composite: Creates a white circular shape at (435, 164) with radius 18 then Places a yellow line segment connecting (195, 46) to (365, 110).
; PLAN: r0=435(x), r1=164(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x1), r6=46(y1), r7=365(x2), r8=110(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 164
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 46
LDI r7, 365
LDI r8, 110
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
