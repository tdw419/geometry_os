; DESCRIPTION: Composite: Places a magenta dot at position (504, 144) then Places a red line segment connecting (312, 91) to (68, 125).
; PLAN: r0=504(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=312(x1), r6=91(y1), r7=68(x2), r8=125(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 504
LDI r1, 144
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 91
LDI r7, 68
LDI r8, 125
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
