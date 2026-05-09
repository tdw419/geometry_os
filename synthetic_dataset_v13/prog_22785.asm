; DESCRIPTION: Renders a green line between points (510, 77) and (103, 159).
; PLAN: r0=510(x1), r1=77(y1), r2=103(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 77
LDI r2, 103
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
