; DESCRIPTION: Renders a green line between points (113, 141) and (370, 142).
; PLAN: r0=113(x1), r1=141(y1), r2=370(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 141
LDI r2, 370
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
