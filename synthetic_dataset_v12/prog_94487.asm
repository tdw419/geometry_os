; DESCRIPTION: Composite: Places a yellow dot at position (48, 11) then Draws a yellow line from (424, 185) to (337, 186).
; PLAN: r0=48(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=424(x1), r6=185(y1), r7=337(x2), r8=186(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 48
LDI r1, 11
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 424
LDI r6, 185
LDI r7, 337
LDI r8, 186
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
