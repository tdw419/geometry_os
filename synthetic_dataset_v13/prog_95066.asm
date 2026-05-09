; DESCRIPTION: Composite: Renders a orange disk with center (83, 209) and radius 26 then Draws a yellow line from (255, 57) to (443, 89).
; PLAN: r0=83(x), r1=209(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x1), r6=57(y1), r7=443(x2), r8=89(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 209
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 57
LDI r7, 443
LDI r8, 89
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
