; DESCRIPTION: Renders a green line between points (195, 243) and (217, 250).
; PLAN: r0=195(x1), r1=243(y1), r2=217(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 243
LDI r2, 217
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
