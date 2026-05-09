; DESCRIPTION: Draws a green line from (176, 16) to (109, 102).
; PLAN: r0=176(x1), r1=16(y1), r2=109(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 16
LDI r2, 109
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
