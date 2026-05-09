; DESCRIPTION: Draws a green line from (455, 250) to (159, 173).
; PLAN: r0=455(x1), r1=250(y1), r2=159(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 250
LDI r2, 159
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
