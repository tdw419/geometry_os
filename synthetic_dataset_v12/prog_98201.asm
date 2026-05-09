; DESCRIPTION: Places a yellow line segment connecting (71, 57) to (98, 143).
; PLAN: r0=71(x1), r1=57(y1), r2=98(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 57
LDI r2, 98
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
