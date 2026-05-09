; DESCRIPTION: Places a cyan line segment connecting (169, 171) to (193, 131).
; PLAN: r0=169(x1), r1=171(y1), r2=193(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 171
LDI r2, 193
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
