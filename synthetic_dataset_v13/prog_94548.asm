; DESCRIPTION: Places a orange line segment connecting (171, 230) to (309, 118).
; PLAN: r0=171(x1), r1=230(y1), r2=309(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 230
LDI r2, 309
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
