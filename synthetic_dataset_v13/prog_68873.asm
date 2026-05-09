; DESCRIPTION: Places a white line segment connecting (265, 52) to (85, 27).
; PLAN: r0=265(x1), r1=52(y1), r2=85(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 52
LDI r2, 85
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
