; DESCRIPTION: Draws a green line from (8, 80) to (18, 125).
; PLAN: r0=8(x1), r1=80(y1), r2=18(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 80
LDI r2, 18
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
