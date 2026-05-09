; DESCRIPTION: Draws a magenta line from (341, 153) to (197, 164).
; PLAN: r0=341(x1), r1=153(y1), r2=197(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 153
LDI r2, 197
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
