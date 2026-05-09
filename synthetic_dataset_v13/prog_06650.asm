; DESCRIPTION: Composite: Draws a yellow circle centered at (239, 159) with radius 68 then Draws a white line from (24, 17) to (39, 207).
; PLAN: r0=239(x), r1=159(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x1), r6=17(y1), r7=39(x2), r8=207(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 159
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 17
LDI r7, 39
LDI r8, 207
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
