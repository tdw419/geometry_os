; DESCRIPTION: Composite: Places a red dot at position (181, 21) then Renders a yellow line between points (36, 6) and (270, 99).
; PLAN: r0=181(x), r1=21(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=36(x1), r6=6(y1), r7=270(x2), r8=99(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 21
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 36
LDI r6, 6
LDI r7, 270
LDI r8, 99
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
