; DESCRIPTION: Draws a white line from (383, 33) to (178, 38).
; PLAN: r0=383(x1), r1=33(y1), r2=178(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 33
LDI r2, 178
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
