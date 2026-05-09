; DESCRIPTION: Draws a white line from (412, 169) to (412, 204).
; PLAN: r0=412(x1), r1=169(y1), r2=412(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 169
LDI r2, 412
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
