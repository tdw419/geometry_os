; DESCRIPTION: Draws a green line from (290, 49) to (371, 93).
; PLAN: r0=290(x1), r1=49(y1), r2=371(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 49
LDI r2, 371
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
