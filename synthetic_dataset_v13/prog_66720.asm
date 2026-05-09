; DESCRIPTION: Draws a magenta line from (510, 28) to (124, 138).
; PLAN: r0=510(x1), r1=28(y1), r2=124(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 28
LDI r2, 124
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
