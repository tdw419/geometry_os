; DESCRIPTION: Composite: Renders a white disk with center (149, 149) and radius 64 then Draws a black line from (272, 3) to (177, 52).
; PLAN: r0=149(x), r1=149(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x1), r6=3(y1), r7=177(x2), r8=52(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 149
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 3
LDI r7, 177
LDI r8, 52
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
