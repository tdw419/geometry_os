; DESCRIPTION: Renders a white line between points (46, 199) and (383, 152).
; PLAN: r0=46(x1), r1=199(y1), r2=383(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 199
LDI r2, 383
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
