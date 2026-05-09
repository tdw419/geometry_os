; DESCRIPTION: Renders a green line between points (344, 97) and (317, 254).
; PLAN: r0=344(x1), r1=97(y1), r2=317(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 97
LDI r2, 317
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
