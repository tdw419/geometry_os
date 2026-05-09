; DESCRIPTION: Draws a white line from (23, 26) to (300, 91).
; PLAN: r0=23(x1), r1=26(y1), r2=300(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 26
LDI r2, 300
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
