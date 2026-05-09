; DESCRIPTION: Draws a green line from (417, 24) to (270, 52).
; PLAN: r0=417(x1), r1=24(y1), r2=270(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 24
LDI r2, 270
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
