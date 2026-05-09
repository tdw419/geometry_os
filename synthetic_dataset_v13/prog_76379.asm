; DESCRIPTION: Places a red line segment connecting (264, 6) to (245, 143).
; PLAN: r0=264(x1), r1=6(y1), r2=245(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 6
LDI r2, 245
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
