; DESCRIPTION: Draws a white line from (103, 214) to (260, 167).
; PLAN: r0=103(x1), r1=214(y1), r2=260(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 214
LDI r2, 260
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
