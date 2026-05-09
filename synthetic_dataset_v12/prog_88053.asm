; DESCRIPTION: Places a white line segment connecting (90, 254) to (209, 41).
; PLAN: r0=90(x1), r1=254(y1), r2=209(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 254
LDI r2, 209
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
