; DESCRIPTION: Renders a white line between points (181, 212) and (392, 73).
; PLAN: r0=181(x1), r1=212(y1), r2=392(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 212
LDI r2, 392
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
