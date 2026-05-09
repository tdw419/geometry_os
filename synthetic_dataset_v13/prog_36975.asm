; DESCRIPTION: Draws a white line from (403, 32) to (132, 241).
; PLAN: r0=403(x1), r1=32(y1), r2=132(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 32
LDI r2, 132
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
