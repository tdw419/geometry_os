; DESCRIPTION: Composite: Places a magenta dot at position (23, 33) then Places a white line segment connecting (40, 219) to (109, 58).
; PLAN: r0=23(x), r1=33(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=40(x1), r6=219(y1), r7=109(x2), r8=58(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 33
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 40
LDI r6, 219
LDI r7, 109
LDI r8, 58
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
