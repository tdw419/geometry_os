; DESCRIPTION: Draws a yellow line from (199, 93) to (130, 124).
; PLAN: r0=199(x1), r1=93(y1), r2=130(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 93
LDI r2, 130
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
