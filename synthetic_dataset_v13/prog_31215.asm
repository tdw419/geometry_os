; DESCRIPTION: Renders a green line between points (200, 164) and (213, 108).
; PLAN: r0=200(x1), r1=164(y1), r2=213(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 164
LDI r2, 213
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
