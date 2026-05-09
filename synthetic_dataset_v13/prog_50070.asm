; DESCRIPTION: Draws a blue line from (360, 126) to (299, 7).
; PLAN: r0=360(x1), r1=126(y1), r2=299(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 126
LDI r2, 299
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
