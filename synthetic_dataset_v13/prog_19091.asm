; DESCRIPTION: Composite: Places a purple dot at position (455, 221) then Renders a white line between points (70, 25) and (166, 141).
; PLAN: r0=455(x), r1=221(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=70(x1), r6=25(y1), r7=166(x2), r8=141(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 221
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 70
LDI r6, 25
LDI r7, 166
LDI r8, 141
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
