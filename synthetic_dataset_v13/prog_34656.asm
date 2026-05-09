; DESCRIPTION: Places a white line segment connecting (305, 127) to (292, 247).
; PLAN: r0=305(x1), r1=127(y1), r2=292(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 127
LDI r2, 292
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
