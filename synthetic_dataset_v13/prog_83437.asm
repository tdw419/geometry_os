; DESCRIPTION: Renders a white line between points (186, 20) and (277, 197).
; PLAN: r0=186(x1), r1=20(y1), r2=277(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 20
LDI r2, 277
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
