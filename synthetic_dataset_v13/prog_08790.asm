; DESCRIPTION: Composite: Places a green circle of radius 74 at center (381, 108) then Places a magenta line segment connecting (217, 110) to (68, 63).
; PLAN: r0=381(x), r1=108(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x1), r6=110(y1), r7=68(x2), r8=63(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 108
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 110
LDI r7, 68
LDI r8, 63
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
