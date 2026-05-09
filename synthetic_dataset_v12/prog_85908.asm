; DESCRIPTION: Places a green line segment connecting (295, 190) to (31, 51).
; PLAN: r0=295(x1), r1=190(y1), r2=31(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 190
LDI r2, 31
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
