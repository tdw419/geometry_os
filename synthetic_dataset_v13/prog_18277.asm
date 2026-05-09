; DESCRIPTION: Draws a green line from (388, 124) to (19, 193).
; PLAN: r0=388(x1), r1=124(y1), r2=19(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 124
LDI r2, 19
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
