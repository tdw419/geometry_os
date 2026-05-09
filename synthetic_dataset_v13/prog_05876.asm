; DESCRIPTION: Draws a magenta line from (290, 33) to (305, 251).
; PLAN: r0=290(x1), r1=33(y1), r2=305(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 33
LDI r2, 305
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
