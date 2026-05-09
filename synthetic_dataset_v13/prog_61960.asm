; DESCRIPTION: Draws a magenta line from (98, 34) to (279, 171).
; PLAN: r0=98(x1), r1=34(y1), r2=279(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 34
LDI r2, 279
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
