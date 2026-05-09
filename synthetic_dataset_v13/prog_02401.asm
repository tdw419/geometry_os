; DESCRIPTION: Places a white line segment connecting (75, 93) to (428, 221).
; PLAN: r0=75(x1), r1=93(y1), r2=428(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 93
LDI r2, 428
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
