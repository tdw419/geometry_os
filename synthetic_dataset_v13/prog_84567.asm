; DESCRIPTION: Draws a green line from (510, 189) to (435, 131).
; PLAN: r0=510(x1), r1=189(y1), r2=435(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 189
LDI r2, 435
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
