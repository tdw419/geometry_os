; DESCRIPTION: Composite: Draws a blue circle centered at (406, 179) with radius 24 then Places a green line segment connecting (294, 9) to (39, 63).
; PLAN: r0=406(x), r1=179(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x1), r6=9(y1), r7=39(x2), r8=63(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 179
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 9
LDI r7, 39
LDI r8, 63
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
