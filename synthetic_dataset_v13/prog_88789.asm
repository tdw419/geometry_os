; DESCRIPTION: Draws a green line from (171, 32) to (24, 45).
; PLAN: r0=171(x1), r1=32(y1), r2=24(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 32
LDI r2, 24
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
