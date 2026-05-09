; DESCRIPTION: Places a red line segment connecting (261, 212) to (33, 146).
; PLAN: r0=261(x1), r1=212(y1), r2=33(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 212
LDI r2, 33
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
