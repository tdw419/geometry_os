; DESCRIPTION: Composite: Places a white dot at position (95, 3) then Renders a white line between points (131, 233) and (220, 243).
; PLAN: r0=95(x), r1=3(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=131(x1), r6=233(y1), r7=220(x2), r8=243(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 3
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 233
LDI r7, 220
LDI r8, 243
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
