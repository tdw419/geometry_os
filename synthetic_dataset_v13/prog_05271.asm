; DESCRIPTION: Renders a magenta line between points (342, 214) and (436, 91).
; PLAN: r0=342(x1), r1=214(y1), r2=436(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 214
LDI r2, 436
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
