; DESCRIPTION: Places a red line segment connecting (502, 205) to (381, 23).
; PLAN: r0=502(x1), r1=205(y1), r2=381(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 205
LDI r2, 381
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
