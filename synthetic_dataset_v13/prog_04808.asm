; DESCRIPTION: Composite: Places a cyan dot at position (93, 38) then Draws a black line from (319, 105) to (65, 113).
; PLAN: r0=93(x), r1=38(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=105(y1), r7=65(x2), r8=113(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 38
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 105
LDI r7, 65
LDI r8, 113
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
