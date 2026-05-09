; DESCRIPTION: Places a black line segment connecting (217, 207) to (306, 192).
; PLAN: r0=217(x1), r1=207(y1), r2=306(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 207
LDI r2, 306
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
