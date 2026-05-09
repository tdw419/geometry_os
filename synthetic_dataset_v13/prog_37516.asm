; DESCRIPTION: Composite: Sets a single purple pixel at (107, 219) then Places a white line segment connecting (402, 95) to (305, 138).
; PLAN: r0=107(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=402(x1), r6=95(y1), r7=305(x2), r8=138(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 219
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 402
LDI r6, 95
LDI r7, 305
LDI r8, 138
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
