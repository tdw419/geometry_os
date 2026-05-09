; DESCRIPTION: Draws a magenta line from (506, 183) to (279, 202).
; PLAN: r0=506(x1), r1=183(y1), r2=279(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 183
LDI r2, 279
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
