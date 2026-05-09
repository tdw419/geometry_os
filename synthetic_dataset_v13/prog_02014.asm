; DESCRIPTION: Composite: Places a yellow line segment connecting (319, 23) to (303, 66) then Renders a cyan disk with center (276, 97) and radius 38.
; PLAN: r0=319(x1), r1=23(y1), r2=303(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=97(y), r7=38(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 319
LDI r1, 23
LDI r2, 303
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 97
LDI r7, 38
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
