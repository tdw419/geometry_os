; DESCRIPTION: Draws a magenta line from (101, 181) to (410, 195).
; PLAN: r0=101(x1), r1=181(y1), r2=410(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 181
LDI r2, 410
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
