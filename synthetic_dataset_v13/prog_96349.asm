; DESCRIPTION: Draws a black line from (175, 243) to (60, 168).
; PLAN: r0=175(x1), r1=243(y1), r2=60(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 243
LDI r2, 60
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
