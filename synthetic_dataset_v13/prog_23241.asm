; DESCRIPTION: Draws a magenta line from (30, 240) to (33, 195).
; PLAN: r0=30(x1), r1=240(y1), r2=33(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 240
LDI r2, 33
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
