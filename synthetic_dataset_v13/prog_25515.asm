; DESCRIPTION: Places a white line segment connecting (316, 204) to (16, 91).
; PLAN: r0=316(x1), r1=204(y1), r2=16(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 204
LDI r2, 16
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
