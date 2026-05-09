; DESCRIPTION: Draws a magenta line from (342, 27) to (185, 221).
; PLAN: r0=342(x1), r1=27(y1), r2=185(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 27
LDI r2, 185
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
