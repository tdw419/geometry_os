; DESCRIPTION: Composite: Renders a purple line between points (66, 57) and (127, 139) then Creates a green circular shape at (410, 141) with radius 50.
; PLAN: r0=66(x1), r1=57(y1), r2=127(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=141(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 66
LDI r1, 57
LDI r2, 127
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 141
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
