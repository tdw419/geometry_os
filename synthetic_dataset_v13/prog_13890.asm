; DESCRIPTION: Composite: Places a orange circle of radius 11 at center (375, 221) then Renders a magenta line between points (99, 71) and (379, 192).
; PLAN: r0=375(x), r1=221(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x1), r6=71(y1), r7=379(x2), r8=192(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 221
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 71
LDI r7, 379
LDI r8, 192
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
