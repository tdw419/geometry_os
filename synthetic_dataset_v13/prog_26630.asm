; DESCRIPTION: Draws a blue line from (213, 27) to (75, 34).
; PLAN: r0=213(x1), r1=27(y1), r2=75(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 27
LDI r2, 75
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
