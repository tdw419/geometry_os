; DESCRIPTION: Composite: Renders a magenta line between points (314, 237) and (508, 192) then Places a white circle of radius 27 at center (395, 213).
; PLAN: r0=314(x1), r1=237(y1), r2=508(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=213(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 314
LDI r1, 237
LDI r2, 508
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 213
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
