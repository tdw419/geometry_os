; DESCRIPTION: Draws a green line from (392, 18) to (106, 14).
; PLAN: r0=392(x1), r1=18(y1), r2=106(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 18
LDI r2, 106
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
