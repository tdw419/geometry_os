; DESCRIPTION: Renders a red line between points (326, 197) and (5, 60).
; PLAN: r0=326(x1), r1=197(y1), r2=5(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 197
LDI r2, 5
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
