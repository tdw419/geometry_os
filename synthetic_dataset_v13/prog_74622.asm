; DESCRIPTION: Draws a magenta line from (303, 187) to (231, 183).
; PLAN: r0=303(x1), r1=187(y1), r2=231(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 187
LDI r2, 231
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
