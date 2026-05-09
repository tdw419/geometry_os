; DESCRIPTION: Draws a green line from (227, 150) to (295, 250).
; PLAN: r0=227(x1), r1=150(y1), r2=295(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 150
LDI r2, 295
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
