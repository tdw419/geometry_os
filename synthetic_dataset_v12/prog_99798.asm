; DESCRIPTION: Draws a green line from (98, 29) to (326, 5).
; PLAN: r0=98(x1), r1=29(y1), r2=326(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 29
LDI r2, 326
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
