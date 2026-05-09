; DESCRIPTION: Draws a white line from (13, 209) to (58, 112).
; PLAN: r0=13(x1), r1=209(y1), r2=58(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 209
LDI r2, 58
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
