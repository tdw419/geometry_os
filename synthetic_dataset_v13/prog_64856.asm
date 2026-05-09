; DESCRIPTION: Places a red line segment connecting (180, 243) to (418, 75).
; PLAN: r0=180(x1), r1=243(y1), r2=418(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 243
LDI r2, 418
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
