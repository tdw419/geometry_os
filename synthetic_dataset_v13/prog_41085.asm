; DESCRIPTION: Composite: Places a cyan line segment connecting (81, 189) to (435, 195) then Draws a blue circle centered at (417, 108) with radius 17.
; PLAN: r0=81(x1), r1=189(y1), r2=435(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=108(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 81
LDI r1, 189
LDI r2, 435
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 108
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
