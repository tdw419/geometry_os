; DESCRIPTION: Places a red line segment connecting (48, 223) to (139, 225).
; PLAN: r0=48(x1), r1=223(y1), r2=139(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 223
LDI r2, 139
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
