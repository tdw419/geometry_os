; DESCRIPTION: Renders a green line between points (408, 223) and (72, 17).
; PLAN: r0=408(x1), r1=223(y1), r2=72(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 223
LDI r2, 72
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
