; DESCRIPTION: Places a green line segment connecting (123, 143) to (361, 96).
; PLAN: r0=123(x1), r1=143(y1), r2=361(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 143
LDI r2, 361
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
