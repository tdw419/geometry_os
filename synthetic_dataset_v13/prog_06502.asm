; DESCRIPTION: Composite: Sets a single cyan pixel at (264, 70) then Renders a white line between points (163, 80) and (345, 174).
; PLAN: r0=264(x), r1=70(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=163(x1), r6=80(y1), r7=345(x2), r8=174(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 70
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 163
LDI r6, 80
LDI r7, 345
LDI r8, 174
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
