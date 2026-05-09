; DESCRIPTION: Draws a blue line from (395, 23) to (449, 111).
; PLAN: r0=395(x1), r1=23(y1), r2=449(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 23
LDI r2, 449
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
