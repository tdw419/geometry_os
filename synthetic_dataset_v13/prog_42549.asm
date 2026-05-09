; DESCRIPTION: Composite: Creates a red circular shape at (461, 127) with radius 33 then Places a magenta line segment connecting (118, 27) to (283, 94).
; PLAN: r0=461(x), r1=127(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x1), r6=27(y1), r7=283(x2), r8=94(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 127
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 27
LDI r7, 283
LDI r8, 94
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
