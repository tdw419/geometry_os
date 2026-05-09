; DESCRIPTION: Renders a green line between points (448, 175) and (364, 215).
; PLAN: r0=448(x1), r1=175(y1), r2=364(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 175
LDI r2, 364
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
