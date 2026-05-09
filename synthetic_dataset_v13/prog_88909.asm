; DESCRIPTION: Draws a magenta line from (307, 116) to (35, 195).
; PLAN: r0=307(x1), r1=116(y1), r2=35(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 116
LDI r2, 35
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
