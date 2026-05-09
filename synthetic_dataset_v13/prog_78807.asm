; DESCRIPTION: Composite: Places a cyan dot at position (363, 68) then Renders a white line between points (414, 104) and (238, 67).
; PLAN: r0=363(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=414(x1), r6=104(y1), r7=238(x2), r8=67(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 104
LDI r7, 238
LDI r8, 67
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
