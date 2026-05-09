; DESCRIPTION: Draws a yellow line from (313, 77) to (386, 248).
; PLAN: r0=313(x1), r1=77(y1), r2=386(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 77
LDI r2, 386
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
