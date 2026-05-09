; DESCRIPTION: Composite: Places a white dot at position (105, 39) then Renders a green line between points (445, 186) and (455, 232).
; PLAN: r0=105(x), r1=39(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=445(x1), r6=186(y1), r7=455(x2), r8=232(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 39
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 445
LDI r6, 186
LDI r7, 455
LDI r8, 232
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
