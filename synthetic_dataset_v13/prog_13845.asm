; DESCRIPTION: Renders a white line between points (4, 207) and (345, 82).
; PLAN: r0=4(x1), r1=207(y1), r2=345(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 207
LDI r2, 345
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
