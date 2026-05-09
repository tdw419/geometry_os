; DESCRIPTION: Draws a magenta line from (356, 190) to (309, 187).
; PLAN: r0=356(x1), r1=190(y1), r2=309(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 190
LDI r2, 309
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
