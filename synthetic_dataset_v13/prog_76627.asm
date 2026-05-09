; DESCRIPTION: Renders a green line between points (46, 163) and (217, 197).
; PLAN: r0=46(x1), r1=163(y1), r2=217(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 163
LDI r2, 217
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
