; DESCRIPTION: Renders a magenta line between points (221, 37) and (57, 38).
; PLAN: r0=221(x1), r1=37(y1), r2=57(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 37
LDI r2, 57
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
