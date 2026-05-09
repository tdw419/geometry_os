; DESCRIPTION: Draws a yellow line from (388, 207) to (365, 180).
; PLAN: r0=388(x1), r1=207(y1), r2=365(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 207
LDI r2, 365
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
