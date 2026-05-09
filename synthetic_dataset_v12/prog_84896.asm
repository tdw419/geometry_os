; DESCRIPTION: Places a yellow line segment connecting (398, 230) to (446, 102).
; PLAN: r0=398(x1), r1=230(y1), r2=446(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 230
LDI r2, 446
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
