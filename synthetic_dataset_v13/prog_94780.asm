; DESCRIPTION: Composite: Renders a magenta line between points (418, 194) and (389, 7) then Renders a red disk with center (126, 48) and radius 36.
; PLAN: r0=418(x1), r1=194(y1), r2=389(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=48(y), r7=36(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 418
LDI r1, 194
LDI r2, 389
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 48
LDI r7, 36
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
