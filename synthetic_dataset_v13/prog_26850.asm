; DESCRIPTION: Draws a blue line from (388, 213) to (191, 193).
; PLAN: r0=388(x1), r1=213(y1), r2=191(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 213
LDI r2, 191
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
