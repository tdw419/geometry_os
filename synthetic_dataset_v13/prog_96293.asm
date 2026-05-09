; DESCRIPTION: Places a green line segment connecting (175, 115) to (379, 236).
; PLAN: r0=175(x1), r1=115(y1), r2=379(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 115
LDI r2, 379
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
