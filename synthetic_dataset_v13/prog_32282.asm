; DESCRIPTION: Places a yellow line segment connecting (386, 77) to (465, 82).
; PLAN: r0=386(x1), r1=77(y1), r2=465(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 77
LDI r2, 465
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
