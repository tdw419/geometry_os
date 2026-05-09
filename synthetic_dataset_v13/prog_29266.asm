; DESCRIPTION: Draws a magenta line from (411, 67) to (171, 66).
; PLAN: r0=411(x1), r1=67(y1), r2=171(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 67
LDI r2, 171
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
