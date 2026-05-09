; DESCRIPTION: Draws a green line from (417, 57) to (315, 187).
; PLAN: r0=417(x1), r1=57(y1), r2=315(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 57
LDI r2, 315
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
