; DESCRIPTION: Composite: Renders a cyan line between points (10, 97) and (398, 71) then Draws a cyan circle centered at (373, 189) with radius 60.
; PLAN: r0=10(x1), r1=97(y1), r2=398(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=189(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 10
LDI r1, 97
LDI r2, 398
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 189
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
