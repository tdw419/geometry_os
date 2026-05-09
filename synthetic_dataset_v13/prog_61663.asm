; DESCRIPTION: Composite: Places a yellow dot at position (299, 19) then Draws a white line from (400, 64) to (273, 115).
; PLAN: r0=299(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=400(x1), r6=64(y1), r7=273(x2), r8=115(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 400
LDI r6, 64
LDI r7, 273
LDI r8, 115
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
