; DESCRIPTION: Places a cyan line segment connecting (230, 141) to (438, 233).
; PLAN: r0=230(x1), r1=141(y1), r2=438(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 141
LDI r2, 438
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
