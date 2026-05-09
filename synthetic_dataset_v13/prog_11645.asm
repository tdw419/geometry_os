; DESCRIPTION: Composite: Places a green dot at position (414, 225) then Renders a white line between points (408, 77) and (368, 218).
; PLAN: r0=414(x), r1=225(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=408(x1), r6=77(y1), r7=368(x2), r8=218(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 225
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 408
LDI r6, 77
LDI r7, 368
LDI r8, 218
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
