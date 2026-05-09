; DESCRIPTION: Composite: Creates a green circular shape at (248, 126) with radius 75 then Draws a cyan line from (189, 251) to (266, 40).
; PLAN: r0=248(x), r1=126(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x1), r6=251(y1), r7=266(x2), r8=40(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 126
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 251
LDI r7, 266
LDI r8, 40
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
