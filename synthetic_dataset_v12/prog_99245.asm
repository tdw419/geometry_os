; DESCRIPTION: Draws a green line from (170, 157) to (342, 174).
; PLAN: r0=170(x1), r1=157(y1), r2=342(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 157
LDI r2, 342
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
