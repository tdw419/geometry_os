; DESCRIPTION: Composite: Renders a red line between points (145, 7) and (272, 234) then Places a white circle of radius 26 at center (337, 223).
; PLAN: r0=145(x1), r1=7(y1), r2=272(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=223(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 145
LDI r1, 7
LDI r2, 272
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 223
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
