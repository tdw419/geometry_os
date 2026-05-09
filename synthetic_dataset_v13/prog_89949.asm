; DESCRIPTION: Draws a green line from (236, 139) to (353, 57).
; PLAN: r0=236(x1), r1=139(y1), r2=353(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 139
LDI r2, 353
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
