; DESCRIPTION: Draws a white line from (18, 179) to (383, 171).
; PLAN: r0=18(x1), r1=179(y1), r2=383(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 179
LDI r2, 383
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
