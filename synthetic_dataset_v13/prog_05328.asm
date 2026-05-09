; DESCRIPTION: Draws a magenta line from (398, 163) to (179, 115).
; PLAN: r0=398(x1), r1=163(y1), r2=179(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 163
LDI r2, 179
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
