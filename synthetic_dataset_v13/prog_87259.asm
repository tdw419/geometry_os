; DESCRIPTION: Composite: Places a red dot at position (256, 230) then Draws a green line from (475, 155) to (200, 109).
; PLAN: r0=256(x), r1=230(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=475(x1), r6=155(y1), r7=200(x2), r8=109(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 230
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 475
LDI r6, 155
LDI r7, 200
LDI r8, 109
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
