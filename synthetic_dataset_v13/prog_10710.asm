; DESCRIPTION: Draws a green line from (181, 130) to (69, 134).
; PLAN: r0=181(x1), r1=130(y1), r2=69(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 130
LDI r2, 69
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
