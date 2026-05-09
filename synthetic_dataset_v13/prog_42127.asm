; DESCRIPTION: Draws a magenta line from (410, 206) to (196, 112).
; PLAN: r0=410(x1), r1=206(y1), r2=196(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 206
LDI r2, 196
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
