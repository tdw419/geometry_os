; DESCRIPTION: Draws a black line from (164, 10) to (464, 120).
; PLAN: r0=164(x1), r1=10(y1), r2=464(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 10
LDI r2, 464
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
