; DESCRIPTION: Places a cyan line segment connecting (310, 121) to (409, 183).
; PLAN: r0=310(x1), r1=121(y1), r2=409(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 121
LDI r2, 409
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
