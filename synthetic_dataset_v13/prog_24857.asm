; DESCRIPTION: Draws a green line from (339, 65) to (274, 236).
; PLAN: r0=339(x1), r1=65(y1), r2=274(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 65
LDI r2, 274
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
