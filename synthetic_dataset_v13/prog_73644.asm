; DESCRIPTION: Composite: Draws a orange line from (35, 225) to (218, 9) then Renders a red disk with center (469, 61) and radius 13.
; PLAN: r0=35(x1), r1=225(y1), r2=218(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=61(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 35
LDI r1, 225
LDI r2, 218
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 61
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
