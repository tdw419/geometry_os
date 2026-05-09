; DESCRIPTION: Draws a white line from (502, 4) to (137, 58).
; PLAN: r0=502(x1), r1=4(y1), r2=137(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 4
LDI r2, 137
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
