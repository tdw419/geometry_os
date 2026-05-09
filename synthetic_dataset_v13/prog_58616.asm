; DESCRIPTION: Draws a magenta line from (347, 233) to (273, 246).
; PLAN: r0=347(x1), r1=233(y1), r2=273(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 233
LDI r2, 273
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
