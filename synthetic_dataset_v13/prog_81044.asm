; DESCRIPTION: Draws a magenta line from (263, 33) to (270, 177).
; PLAN: r0=263(x1), r1=33(y1), r2=270(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 33
LDI r2, 270
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
