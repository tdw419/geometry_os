; DESCRIPTION: Draws a green line from (192, 14) to (75, 134).
; PLAN: r0=192(x1), r1=14(y1), r2=75(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 14
LDI r2, 75
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
