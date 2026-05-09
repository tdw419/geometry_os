; DESCRIPTION: Draws a blue line from (342, 150) to (187, 207).
; PLAN: r0=342(x1), r1=150(y1), r2=187(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 150
LDI r2, 187
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
