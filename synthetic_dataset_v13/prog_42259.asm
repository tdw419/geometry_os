; DESCRIPTION: Composite: Places a yellow dot at position (491, 187) then Renders a yellow line between points (101, 235) and (268, 54).
; PLAN: r0=491(x), r1=187(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=101(x1), r6=235(y1), r7=268(x2), r8=54(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 187
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 101
LDI r6, 235
LDI r7, 268
LDI r8, 54
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
