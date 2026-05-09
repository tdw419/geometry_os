; DESCRIPTION: Places a green line segment connecting (498, 7) to (107, 17).
; PLAN: r0=498(x1), r1=7(y1), r2=107(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 7
LDI r2, 107
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
