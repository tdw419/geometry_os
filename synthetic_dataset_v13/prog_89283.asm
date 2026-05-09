; DESCRIPTION: Renders a green line between points (293, 91) and (440, 175).
; PLAN: r0=293(x1), r1=91(y1), r2=440(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 91
LDI r2, 440
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
