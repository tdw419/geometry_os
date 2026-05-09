; DESCRIPTION: Draws a red line from (307, 152) to (451, 120).
; PLAN: r0=307(x1), r1=152(y1), r2=451(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 152
LDI r2, 451
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
