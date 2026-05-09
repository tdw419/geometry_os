; DESCRIPTION: Renders a yellow line between points (387, 50) and (15, 178).
; PLAN: r0=387(x1), r1=50(y1), r2=15(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 50
LDI r2, 15
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
