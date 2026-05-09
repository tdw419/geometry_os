; DESCRIPTION: Draws a white line from (61, 2) to (443, 151).
; PLAN: r0=61(x1), r1=2(y1), r2=443(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 2
LDI r2, 443
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
