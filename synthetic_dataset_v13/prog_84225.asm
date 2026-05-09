; DESCRIPTION: Draws a magenta line from (467, 37) to (443, 55).
; PLAN: r0=467(x1), r1=37(y1), r2=443(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 37
LDI r2, 443
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
