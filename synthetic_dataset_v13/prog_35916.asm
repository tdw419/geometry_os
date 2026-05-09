; DESCRIPTION: Renders a magenta line between points (433, 37) and (486, 98).
; PLAN: r0=433(x1), r1=37(y1), r2=486(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 37
LDI r2, 486
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
