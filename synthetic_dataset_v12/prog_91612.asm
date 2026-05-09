; DESCRIPTION: Draws a green line from (449, 130) to (176, 72).
; PLAN: r0=449(x1), r1=130(y1), r2=176(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 130
LDI r2, 176
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
