; DESCRIPTION: Places a cyan line segment connecting (493, 115) to (169, 197).
; PLAN: r0=493(x1), r1=115(y1), r2=169(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 115
LDI r2, 169
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
