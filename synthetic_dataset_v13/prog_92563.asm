; DESCRIPTION: Places a red line segment connecting (504, 26) to (502, 25).
; PLAN: r0=504(x1), r1=26(y1), r2=502(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 26
LDI r2, 502
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
