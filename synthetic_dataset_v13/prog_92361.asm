; DESCRIPTION: Draws a white line from (295, 161) to (84, 254).
; PLAN: r0=295(x1), r1=161(y1), r2=84(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 161
LDI r2, 84
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
