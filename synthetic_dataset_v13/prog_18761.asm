; DESCRIPTION: Renders a magenta line between points (375, 140) and (175, 210).
; PLAN: r0=375(x1), r1=140(y1), r2=175(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 140
LDI r2, 175
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
