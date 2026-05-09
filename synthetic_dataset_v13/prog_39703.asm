; DESCRIPTION: Draws a green line from (159, 221) to (210, 26).
; PLAN: r0=159(x1), r1=221(y1), r2=210(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 221
LDI r2, 210
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
