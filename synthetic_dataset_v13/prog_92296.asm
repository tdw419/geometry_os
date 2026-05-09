; DESCRIPTION: Draws a green line from (182, 220) to (151, 206).
; PLAN: r0=182(x1), r1=220(y1), r2=151(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 220
LDI r2, 151
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
