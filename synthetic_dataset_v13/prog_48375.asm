; DESCRIPTION: Draws a yellow line from (446, 79) to (184, 220).
; PLAN: r0=446(x1), r1=79(y1), r2=184(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 79
LDI r2, 184
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
