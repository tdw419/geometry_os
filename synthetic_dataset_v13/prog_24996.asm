; DESCRIPTION: Draws a white line from (449, 212) to (356, 108).
; PLAN: r0=449(x1), r1=212(y1), r2=356(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 212
LDI r2, 356
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
