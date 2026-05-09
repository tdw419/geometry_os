; DESCRIPTION: Renders a green line between points (177, 28) and (468, 10).
; PLAN: r0=177(x1), r1=28(y1), r2=468(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 28
LDI r2, 468
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
