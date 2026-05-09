; DESCRIPTION: Draws a magenta line from (191, 236) to (389, 111).
; PLAN: r0=191(x1), r1=236(y1), r2=389(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 236
LDI r2, 389
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
