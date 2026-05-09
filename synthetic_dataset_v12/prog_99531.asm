; DESCRIPTION: Composite: Places a purple dot at position (294, 226) then Draws a red line from (269, 254) to (315, 7).
; PLAN: r0=294(x), r1=226(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=269(x1), r6=254(y1), r7=315(x2), r8=7(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 226
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 254
LDI r7, 315
LDI r8, 7
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
