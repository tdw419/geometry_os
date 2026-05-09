; DESCRIPTION: Renders a green line between points (475, 21) and (171, 200).
; PLAN: r0=475(x1), r1=21(y1), r2=171(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 21
LDI r2, 171
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
