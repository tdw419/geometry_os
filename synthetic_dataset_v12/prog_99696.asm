; DESCRIPTION: Draws a green line from (223, 35) to (294, 179).
; PLAN: r0=223(x1), r1=35(y1), r2=294(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 35
LDI r2, 294
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
