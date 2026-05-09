; DESCRIPTION: Places a red line segment connecting (277, 195) to (103, 66).
; PLAN: r0=277(x1), r1=195(y1), r2=103(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 195
LDI r2, 103
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
