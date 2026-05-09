; DESCRIPTION: Places a red line segment connecting (0, 220) to (464, 197).
; PLAN: r0=0(x1), r1=220(y1), r2=464(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 220
LDI r2, 464
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
