; DESCRIPTION: Draws a green line from (187, 113) to (293, 220).
; PLAN: r0=187(x1), r1=113(y1), r2=293(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 113
LDI r2, 293
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
