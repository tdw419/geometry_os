; DESCRIPTION: Draws a green line from (187, 130) to (493, 129).
; PLAN: r0=187(x1), r1=130(y1), r2=493(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 130
LDI r2, 493
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
