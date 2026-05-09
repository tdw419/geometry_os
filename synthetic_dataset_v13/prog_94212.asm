; DESCRIPTION: Renders a black line between points (10, 205) and (464, 207).
; PLAN: r0=10(x1), r1=205(y1), r2=464(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 205
LDI r2, 464
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
