; DESCRIPTION: Draws a green line from (338, 193) to (167, 225).
; PLAN: r0=338(x1), r1=193(y1), r2=167(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 193
LDI r2, 167
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
