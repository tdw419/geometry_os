; DESCRIPTION: Draws a blue line from (386, 27) to (359, 135).
; PLAN: r0=386(x1), r1=27(y1), r2=359(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 27
LDI r2, 359
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
