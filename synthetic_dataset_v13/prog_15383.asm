; DESCRIPTION: Draws a green line from (236, 130) to (136, 107).
; PLAN: r0=236(x1), r1=130(y1), r2=136(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 130
LDI r2, 136
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
