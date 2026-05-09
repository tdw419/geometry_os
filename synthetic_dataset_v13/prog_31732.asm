; DESCRIPTION: Draws a white line from (141, 32) to (297, 225).
; PLAN: r0=141(x1), r1=32(y1), r2=297(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 32
LDI r2, 297
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
