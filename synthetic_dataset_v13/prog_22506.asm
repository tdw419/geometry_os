; DESCRIPTION: Places a red line segment connecting (462, 223) to (354, 91).
; PLAN: r0=462(x1), r1=223(y1), r2=354(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 223
LDI r2, 354
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
