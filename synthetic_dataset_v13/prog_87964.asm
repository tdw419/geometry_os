; DESCRIPTION: Draws a magenta line from (349, 173) to (468, 82).
; PLAN: r0=349(x1), r1=173(y1), r2=468(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 173
LDI r2, 468
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
