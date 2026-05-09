; DESCRIPTION: Draws a blue line from (467, 233) to (445, 31).
; PLAN: r0=467(x1), r1=233(y1), r2=445(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 233
LDI r2, 445
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
