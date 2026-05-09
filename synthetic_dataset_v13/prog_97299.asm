; DESCRIPTION: Composite: Places a blue dot at position (129, 254) then Renders a red line between points (78, 173) and (101, 30).
; PLAN: r0=129(x), r1=254(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=78(x1), r6=173(y1), r7=101(x2), r8=30(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 254
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 173
LDI r7, 101
LDI r8, 30
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
