; DESCRIPTION: Draws a white line from (386, 212) to (286, 218).
; PLAN: r0=386(x1), r1=212(y1), r2=286(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 212
LDI r2, 286
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
