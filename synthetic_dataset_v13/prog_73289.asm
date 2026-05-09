; DESCRIPTION: Places a green line segment connecting (131, 143) to (502, 212).
; PLAN: r0=131(x1), r1=143(y1), r2=502(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 143
LDI r2, 502
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
