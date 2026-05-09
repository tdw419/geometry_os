; DESCRIPTION: Draws a magenta line from (444, 180) to (502, 145).
; PLAN: r0=444(x1), r1=180(y1), r2=502(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 180
LDI r2, 502
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
