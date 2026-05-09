; DESCRIPTION: Composite: Renders a white box of size 56x17 starting at (391, 200) then Places a cyan line segment connecting (351, 105) to (26, 221).
; PLAN: r0=391(x), r1=200(y), r2=56(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=351(x1), r6=105(y1), r7=26(x2), r8=221(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 200
LDI r2, 56
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 105
LDI r7, 26
LDI r8, 221
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
