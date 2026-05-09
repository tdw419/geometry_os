; DESCRIPTION: Composite: Renders a blue disk with center (453, 117) and radius 44 then Renders a orange line between points (460, 228) and (338, 221).
; PLAN: r0=453(x), r1=117(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x1), r6=228(y1), r7=338(x2), r8=221(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 117
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 228
LDI r7, 338
LDI r8, 221
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
