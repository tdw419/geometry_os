; DESCRIPTION: Draws a green line from (502, 200) to (116, 22).
; PLAN: r0=502(x1), r1=200(y1), r2=116(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 200
LDI r2, 116
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
