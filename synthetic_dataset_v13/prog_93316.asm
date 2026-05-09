; DESCRIPTION: Draws a green line from (420, 24) to (10, 14).
; PLAN: r0=420(x1), r1=24(y1), r2=10(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 24
LDI r2, 10
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
