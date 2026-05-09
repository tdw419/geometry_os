; DESCRIPTION: Places a red line segment connecting (305, 19) to (174, 168).
; PLAN: r0=305(x1), r1=19(y1), r2=174(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 19
LDI r2, 174
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
