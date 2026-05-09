; DESCRIPTION: Composite: Places a cyan dot at position (388, 180) then Draws a purple line from (271, 98) to (206, 24).
; PLAN: r0=388(x), r1=180(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=271(x1), r6=98(y1), r7=206(x2), r8=24(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 180
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 271
LDI r6, 98
LDI r7, 206
LDI r8, 24
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
