; DESCRIPTION: Draws a green line from (212, 233) to (57, 48).
; PLAN: r0=212(x1), r1=233(y1), r2=57(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 233
LDI r2, 57
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
