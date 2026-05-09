; DESCRIPTION: Draws a red line from (267, 131) to (392, 132).
; PLAN: r0=267(x1), r1=131(y1), r2=392(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 131
LDI r2, 392
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
