; DESCRIPTION: Composite: Places a white dot at position (11, 127) then Renders a cyan line between points (186, 32) and (339, 59).
; PLAN: r0=11(x), r1=127(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=186(x1), r6=32(y1), r7=339(x2), r8=59(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 11
LDI r1, 127
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 32
LDI r7, 339
LDI r8, 59
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
