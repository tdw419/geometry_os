; DESCRIPTION: Draws a yellow line from (213, 90) to (243, 233).
; PLAN: r0=213(x1), r1=90(y1), r2=243(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 90
LDI r2, 243
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
