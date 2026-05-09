; DESCRIPTION: Composite: Sets a single white pixel at (54, 252) then Draws a magenta line from (459, 191) to (200, 231).
; PLAN: r0=54(x), r1=252(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=459(x1), r6=191(y1), r7=200(x2), r8=231(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 252
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 459
LDI r6, 191
LDI r7, 200
LDI r8, 231
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
