; DESCRIPTION: Draws a green line from (387, 79) to (211, 30).
; PLAN: r0=387(x1), r1=79(y1), r2=211(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 79
LDI r2, 211
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
