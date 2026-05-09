; DESCRIPTION: Draws a green line from (119, 24) to (294, 65).
; PLAN: r0=119(x1), r1=24(y1), r2=294(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 24
LDI r2, 294
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
