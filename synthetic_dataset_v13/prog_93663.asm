; DESCRIPTION: Composite: Places a magenta line segment connecting (23, 4) to (504, 210) then Sets a single magenta pixel at (294, 152).
; PLAN: r0=23(x1), r1=4(y1), r2=504(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=152(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 23
LDI r1, 4
LDI r2, 504
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 152
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
