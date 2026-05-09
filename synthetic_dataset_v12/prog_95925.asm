; DESCRIPTION: Draws a magenta line from (250, 99) to (433, 146).
; PLAN: r0=250(x1), r1=99(y1), r2=433(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 99
LDI r2, 433
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
