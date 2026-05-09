; DESCRIPTION: Draws a purple line from (502, 171) to (507, 31).
; PLAN: r0=502(x1), r1=171(y1), r2=507(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 171
LDI r2, 507
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
