; DESCRIPTION: Composite: Sets a single yellow pixel at (221, 143) then Draws a yellow line from (256, 59) to (298, 200).
; PLAN: r0=221(x), r1=143(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=256(x1), r6=59(y1), r7=298(x2), r8=200(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 143
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 256
LDI r6, 59
LDI r7, 298
LDI r8, 200
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
