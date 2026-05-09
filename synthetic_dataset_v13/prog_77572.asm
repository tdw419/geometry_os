; DESCRIPTION: Draws a white line from (394, 100) to (112, 91).
; PLAN: r0=394(x1), r1=100(y1), r2=112(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 100
LDI r2, 112
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
