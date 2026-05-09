; DESCRIPTION: Draws a blue line from (111, 163) to (386, 89).
; PLAN: r0=111(x1), r1=163(y1), r2=386(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 163
LDI r2, 386
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
