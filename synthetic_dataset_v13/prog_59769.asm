; DESCRIPTION: Draws a magenta line from (150, 124) to (143, 144).
; PLAN: r0=150(x1), r1=124(y1), r2=143(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 124
LDI r2, 143
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
