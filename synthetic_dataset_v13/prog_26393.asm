; DESCRIPTION: Places a red line segment connecting (315, 66) to (281, 91).
; PLAN: r0=315(x1), r1=66(y1), r2=281(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 66
LDI r2, 281
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
