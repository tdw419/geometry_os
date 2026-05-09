; DESCRIPTION: Draws a purple line from (394, 131) to (267, 236).
; PLAN: r0=394(x1), r1=131(y1), r2=267(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 131
LDI r2, 267
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
