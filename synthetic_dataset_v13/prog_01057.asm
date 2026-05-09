; DESCRIPTION: Places a cyan line segment connecting (230, 38) to (207, 100).
; PLAN: r0=230(x1), r1=38(y1), r2=207(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 38
LDI r2, 207
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
