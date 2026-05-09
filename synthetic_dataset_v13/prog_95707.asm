; DESCRIPTION: Draws a magenta line from (394, 82) to (349, 201).
; PLAN: r0=394(x1), r1=82(y1), r2=349(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 82
LDI r2, 349
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
