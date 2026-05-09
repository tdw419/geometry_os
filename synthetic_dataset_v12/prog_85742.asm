; DESCRIPTION: Draws a green line from (399, 130) to (448, 166).
; PLAN: r0=399(x1), r1=130(y1), r2=448(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 130
LDI r2, 448
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
