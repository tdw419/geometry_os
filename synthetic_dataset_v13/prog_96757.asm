; DESCRIPTION: Composite: Places a white dot at position (153, 194) then Renders a cyan line between points (477, 129) and (414, 135).
; PLAN: r0=153(x), r1=194(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=477(x1), r6=129(y1), r7=414(x2), r8=135(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 194
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 477
LDI r6, 129
LDI r7, 414
LDI r8, 135
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
