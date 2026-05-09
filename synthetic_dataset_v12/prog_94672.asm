; DESCRIPTION: Places a green line segment connecting (466, 96) to (238, 14).
; PLAN: r0=466(x1), r1=96(y1), r2=238(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 96
LDI r2, 238
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
