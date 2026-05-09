; DESCRIPTION: Composite: Places a purple dot at position (424, 247) then Draws a yellow line from (505, 111) to (419, 14).
; PLAN: r0=424(x), r1=247(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=505(x1), r6=111(y1), r7=419(x2), r8=14(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 247
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 505
LDI r6, 111
LDI r7, 419
LDI r8, 14
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
