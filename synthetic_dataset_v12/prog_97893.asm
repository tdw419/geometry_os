; DESCRIPTION: Draws a green line from (225, 204) to (375, 162).
; PLAN: r0=225(x1), r1=204(y1), r2=375(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 204
LDI r2, 375
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
