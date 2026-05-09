; DESCRIPTION: Draws a black line from (243, 79) to (77, 150).
; PLAN: r0=243(x1), r1=79(y1), r2=77(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 79
LDI r2, 77
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
