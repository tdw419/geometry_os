; DESCRIPTION: Draws a magenta line from (443, 89) to (87, 236).
; PLAN: r0=443(x1), r1=89(y1), r2=87(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 89
LDI r2, 87
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
