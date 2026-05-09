; DESCRIPTION: Renders a green line between points (197, 74) and (259, 200).
; PLAN: r0=197(x1), r1=74(y1), r2=259(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 74
LDI r2, 259
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
