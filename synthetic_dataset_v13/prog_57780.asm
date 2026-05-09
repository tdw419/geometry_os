; DESCRIPTION: Draws a blue line from (398, 154) to (434, 58).
; PLAN: r0=398(x1), r1=154(y1), r2=434(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 154
LDI r2, 434
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
