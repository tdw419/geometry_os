; DESCRIPTION: Draws a cyan line from (317, 105) to (219, 216).
; PLAN: r0=317(x1), r1=105(y1), r2=219(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 105
LDI r2, 219
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
