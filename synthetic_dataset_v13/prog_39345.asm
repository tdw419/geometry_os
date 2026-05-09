; DESCRIPTION: Places a red line segment connecting (248, 210) to (230, 222).
; PLAN: r0=248(x1), r1=210(y1), r2=230(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 210
LDI r2, 230
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
