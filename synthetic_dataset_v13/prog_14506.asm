; DESCRIPTION: Renders a green line between points (63, 243) and (346, 181).
; PLAN: r0=63(x1), r1=243(y1), r2=346(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 243
LDI r2, 346
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
