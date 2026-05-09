; DESCRIPTION: Places a cyan line segment connecting (118, 200) to (268, 230).
; PLAN: r0=118(x1), r1=200(y1), r2=268(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 200
LDI r2, 268
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
