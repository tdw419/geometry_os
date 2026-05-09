; DESCRIPTION: Draws a blue line from (410, 168) to (310, 138).
; PLAN: r0=410(x1), r1=168(y1), r2=310(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 168
LDI r2, 310
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
