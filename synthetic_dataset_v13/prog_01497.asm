; DESCRIPTION: Places a red line segment connecting (312, 124) to (146, 165).
; PLAN: r0=312(x1), r1=124(y1), r2=146(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 124
LDI r2, 146
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
