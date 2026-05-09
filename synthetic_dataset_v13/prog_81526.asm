; DESCRIPTION: Draws a green line from (151, 4) to (197, 223).
; PLAN: r0=151(x1), r1=4(y1), r2=197(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 4
LDI r2, 197
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
