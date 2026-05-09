; DESCRIPTION: Places a green line segment connecting (182, 29) to (293, 197).
; PLAN: r0=182(x1), r1=29(y1), r2=293(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 29
LDI r2, 293
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
