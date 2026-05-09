; DESCRIPTION: Renders a green line between points (185, 171) and (400, 202).
; PLAN: r0=185(x1), r1=171(y1), r2=400(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 171
LDI r2, 400
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
