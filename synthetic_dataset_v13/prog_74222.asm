; DESCRIPTION: Renders a green line between points (65, 63) and (428, 86).
; PLAN: r0=65(x1), r1=63(y1), r2=428(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 63
LDI r2, 428
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
