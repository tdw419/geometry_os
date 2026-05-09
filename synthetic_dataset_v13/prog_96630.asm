; DESCRIPTION: Places a red line segment connecting (294, 45) to (361, 20).
; PLAN: r0=294(x1), r1=45(y1), r2=361(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 45
LDI r2, 361
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
