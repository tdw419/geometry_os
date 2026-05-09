; DESCRIPTION: Places a cyan line segment connecting (396, 35) to (277, 155).
; PLAN: r0=396(x1), r1=35(y1), r2=277(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 35
LDI r2, 277
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
