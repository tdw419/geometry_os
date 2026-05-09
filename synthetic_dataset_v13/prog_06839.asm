; DESCRIPTION: Draws a green line from (8, 34) to (294, 161).
; PLAN: r0=8(x1), r1=34(y1), r2=294(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 34
LDI r2, 294
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
