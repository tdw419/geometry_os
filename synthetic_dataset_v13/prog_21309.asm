; DESCRIPTION: Places a red line segment connecting (126, 214) to (343, 243).
; PLAN: r0=126(x1), r1=214(y1), r2=343(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 214
LDI r2, 343
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
