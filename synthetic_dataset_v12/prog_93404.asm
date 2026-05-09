; DESCRIPTION: Composite: Draws a blue circle centered at (96, 111) with radius 35 then Draws a cyan line from (207, 33) to (422, 17).
; PLAN: r0=96(x), r1=111(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x1), r6=33(y1), r7=422(x2), r8=17(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 111
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 33
LDI r7, 422
LDI r8, 17
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
