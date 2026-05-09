; DESCRIPTION: Draws a green line from (243, 30) to (19, 148).
; PLAN: r0=243(x1), r1=30(y1), r2=19(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 30
LDI r2, 19
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
