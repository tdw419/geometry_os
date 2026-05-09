; DESCRIPTION: Composite: Places a yellow line segment connecting (276, 121) to (401, 220) then Places a yellow dot at position (217, 118).
; PLAN: r0=276(x1), r1=121(y1), r2=401(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=118(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 276
LDI r1, 121
LDI r2, 401
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 118
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
