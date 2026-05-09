; DESCRIPTION: Draws a white line from (501, 16) to (417, 24).
; PLAN: r0=501(x1), r1=16(y1), r2=417(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 16
LDI r2, 417
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
