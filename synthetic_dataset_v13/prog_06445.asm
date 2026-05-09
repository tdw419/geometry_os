; DESCRIPTION: Places a cyan line segment connecting (227, 74) to (258, 244).
; PLAN: r0=227(x1), r1=74(y1), r2=258(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 74
LDI r2, 258
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
