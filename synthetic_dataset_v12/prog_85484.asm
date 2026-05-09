; DESCRIPTION: Renders a green line between points (323, 249) and (298, 120).
; PLAN: r0=323(x1), r1=249(y1), r2=298(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 249
LDI r2, 298
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
