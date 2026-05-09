; DESCRIPTION: Composite: Sets a single red pixel at (40, 214) then Draws a yellow line from (339, 230) to (95, 27).
; PLAN: r0=40(x), r1=214(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=339(x1), r6=230(y1), r7=95(x2), r8=27(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 214
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 339
LDI r6, 230
LDI r7, 95
LDI r8, 27
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
