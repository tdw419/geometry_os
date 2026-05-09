; DESCRIPTION: Draws a magenta line from (322, 164) to (383, 50).
; PLAN: r0=322(x1), r1=164(y1), r2=383(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 164
LDI r2, 383
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
