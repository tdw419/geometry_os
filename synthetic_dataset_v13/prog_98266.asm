; DESCRIPTION: Composite: Places a red dot at position (287, 249) then Renders a magenta line between points (509, 101) and (253, 83).
; PLAN: r0=287(x), r1=249(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=509(x1), r6=101(y1), r7=253(x2), r8=83(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 249
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 509
LDI r6, 101
LDI r7, 253
LDI r8, 83
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
