; DESCRIPTION: Places a red line segment connecting (125, 151) to (20, 243).
; PLAN: r0=125(x1), r1=151(y1), r2=20(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 151
LDI r2, 20
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
