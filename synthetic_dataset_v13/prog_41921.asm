; DESCRIPTION: Places a white line segment connecting (146, 132) to (395, 26).
; PLAN: r0=146(x1), r1=132(y1), r2=395(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 132
LDI r2, 395
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
