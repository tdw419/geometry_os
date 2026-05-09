; DESCRIPTION: Composite: Sets a single orange pixel at (502, 3) then Places a black line segment connecting (252, 1) to (39, 171).
; PLAN: r0=502(x), r1=3(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=252(x1), r6=1(y1), r7=39(x2), r8=171(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 502
LDI r1, 3
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 252
LDI r6, 1
LDI r7, 39
LDI r8, 171
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
