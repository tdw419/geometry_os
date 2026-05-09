; DESCRIPTION: Composite: Places a white dot at position (115, 48) then Draws a cyan line from (186, 218) to (225, 68).
; PLAN: r0=115(x), r1=48(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=186(x1), r6=218(y1), r7=225(x2), r8=68(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 48
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 218
LDI r7, 225
LDI r8, 68
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
