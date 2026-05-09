; DESCRIPTION: Draws a magenta line from (279, 126) to (73, 195).
; PLAN: r0=279(x1), r1=126(y1), r2=73(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 126
LDI r2, 73
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
