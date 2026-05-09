; DESCRIPTION: Draws a cyan line from (409, 145) to (243, 217).
; PLAN: r0=409(x1), r1=145(y1), r2=243(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 145
LDI r2, 243
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
