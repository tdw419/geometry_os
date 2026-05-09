; DESCRIPTION: Draws a white line from (225, 103) to (200, 223).
; PLAN: r0=225(x1), r1=103(y1), r2=200(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 103
LDI r2, 200
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
