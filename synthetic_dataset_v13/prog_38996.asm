; DESCRIPTION: Draws a green line from (133, 130) to (66, 6).
; PLAN: r0=133(x1), r1=130(y1), r2=66(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 130
LDI r2, 66
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
