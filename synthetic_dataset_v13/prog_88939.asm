; DESCRIPTION: Places a white line segment connecting (276, 254) to (374, 91).
; PLAN: r0=276(x1), r1=254(y1), r2=374(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 254
LDI r2, 374
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
