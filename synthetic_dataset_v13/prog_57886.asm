; DESCRIPTION: Draws a magenta line from (156, 234) to (305, 142).
; PLAN: r0=156(x1), r1=234(y1), r2=305(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 234
LDI r2, 305
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
