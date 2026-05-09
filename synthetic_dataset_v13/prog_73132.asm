; DESCRIPTION: Renders a green line between points (440, 195) and (318, 164).
; PLAN: r0=440(x1), r1=195(y1), r2=318(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 195
LDI r2, 318
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
