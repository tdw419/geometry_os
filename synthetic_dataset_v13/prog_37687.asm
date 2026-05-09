; DESCRIPTION: Draws a red line from (446, 211) to (107, 63).
; PLAN: r0=446(x1), r1=211(y1), r2=107(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 211
LDI r2, 107
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
