; DESCRIPTION: Places a orange line segment connecting (175, 126) to (209, 177).
; PLAN: r0=175(x1), r1=126(y1), r2=209(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 126
LDI r2, 209
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
