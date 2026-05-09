; DESCRIPTION: Composite: Places a orange dot at position (417, 193) then Renders a red line between points (447, 133) and (108, 182).
; PLAN: r0=417(x), r1=193(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=447(x1), r6=133(y1), r7=108(x2), r8=182(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 193
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 447
LDI r6, 133
LDI r7, 108
LDI r8, 182
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
