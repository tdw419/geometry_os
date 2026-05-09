; DESCRIPTION: Places a red line segment connecting (52, 73) to (391, 225).
; PLAN: r0=52(x1), r1=73(y1), r2=391(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 73
LDI r2, 391
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
