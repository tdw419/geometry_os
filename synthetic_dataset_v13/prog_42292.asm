; DESCRIPTION: Composite: Places a red dot at position (338, 40) then Places a white line segment connecting (295, 71) to (58, 229).
; PLAN: r0=338(x), r1=40(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=295(x1), r6=71(y1), r7=58(x2), r8=229(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 40
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 295
LDI r6, 71
LDI r7, 58
LDI r8, 229
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
