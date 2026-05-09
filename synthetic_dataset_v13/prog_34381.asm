; DESCRIPTION: Places a green line segment connecting (361, 127) to (281, 248).
; PLAN: r0=361(x1), r1=127(y1), r2=281(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 127
LDI r2, 281
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
