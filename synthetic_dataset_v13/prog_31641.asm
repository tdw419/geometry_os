; DESCRIPTION: Places a red line segment connecting (267, 169) to (298, 115).
; PLAN: r0=267(x1), r1=169(y1), r2=298(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 169
LDI r2, 298
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
