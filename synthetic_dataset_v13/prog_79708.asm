; DESCRIPTION: Places a orange line segment connecting (298, 179) to (174, 190).
; PLAN: r0=298(x1), r1=179(y1), r2=174(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 179
LDI r2, 174
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
