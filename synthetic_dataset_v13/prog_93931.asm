; DESCRIPTION: Draws a magenta line from (372, 150) to (46, 84).
; PLAN: r0=372(x1), r1=150(y1), r2=46(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 150
LDI r2, 46
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
