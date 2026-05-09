; DESCRIPTION: Places a magenta line segment connecting (361, 77) to (298, 6).
; PLAN: r0=361(x1), r1=77(y1), r2=298(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 77
LDI r2, 298
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
