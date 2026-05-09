; DESCRIPTION: Draws a green line from (360, 219) to (98, 38).
; PLAN: r0=360(x1), r1=219(y1), r2=98(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 219
LDI r2, 98
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
