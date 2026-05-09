; DESCRIPTION: Draws a magenta line from (117, 182) to (307, 162).
; PLAN: r0=117(x1), r1=182(y1), r2=307(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 182
LDI r2, 307
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
