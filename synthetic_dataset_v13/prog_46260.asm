; DESCRIPTION: Places a red line segment connecting (288, 223) to (66, 46).
; PLAN: r0=288(x1), r1=223(y1), r2=66(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 223
LDI r2, 66
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
