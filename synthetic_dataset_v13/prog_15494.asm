; DESCRIPTION: Draws a white line from (60, 238) to (467, 221).
; PLAN: r0=60(x1), r1=238(y1), r2=467(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 238
LDI r2, 467
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
