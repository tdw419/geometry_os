; DESCRIPTION: Composite: Draws a black circle centered at (168, 106) with radius 77 then Draws a green line from (150, 169) to (245, 47).
; PLAN: r0=168(x), r1=106(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x1), r6=169(y1), r7=245(x2), r8=47(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 106
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 169
LDI r7, 245
LDI r8, 47
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
