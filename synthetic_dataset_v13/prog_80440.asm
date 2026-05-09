; DESCRIPTION: Composite: Places a blue dot at position (393, 103) then Places a red line segment connecting (335, 74) to (8, 133).
; PLAN: r0=393(x), r1=103(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=335(x1), r6=74(y1), r7=8(x2), r8=133(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 103
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 335
LDI r6, 74
LDI r7, 8
LDI r8, 133
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
