; DESCRIPTION: Renders a magenta line between points (305, 69) and (76, 160).
; PLAN: r0=305(x1), r1=69(y1), r2=76(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 69
LDI r2, 76
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
