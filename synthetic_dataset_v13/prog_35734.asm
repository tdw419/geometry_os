; DESCRIPTION: Composite: Draws a green circle centered at (143, 72) with radius 46 then Draws a cyan line from (431, 43) to (129, 106).
; PLAN: r0=143(x), r1=72(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x1), r6=43(y1), r7=129(x2), r8=106(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 72
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 43
LDI r7, 129
LDI r8, 106
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
