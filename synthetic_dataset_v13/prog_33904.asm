; DESCRIPTION: Places a white line segment connecting (126, 1) to (286, 71).
; PLAN: r0=126(x1), r1=1(y1), r2=286(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 1
LDI r2, 286
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
