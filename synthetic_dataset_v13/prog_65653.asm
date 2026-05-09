; DESCRIPTION: Draws a green line from (175, 245) to (417, 61).
; PLAN: r0=175(x1), r1=245(y1), r2=417(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 245
LDI r2, 417
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
