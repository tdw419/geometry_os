; DESCRIPTION: Renders a green line between points (467, 218) and (465, 38).
; PLAN: r0=467(x1), r1=218(y1), r2=465(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 218
LDI r2, 465
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
