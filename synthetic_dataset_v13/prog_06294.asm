; DESCRIPTION: Composite: Places a cyan dot at position (432, 103) then Draws a blue line from (426, 230) to (262, 173).
; PLAN: r0=432(x), r1=103(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=426(x1), r6=230(y1), r7=262(x2), r8=173(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 103
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 426
LDI r6, 230
LDI r7, 262
LDI r8, 173
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
