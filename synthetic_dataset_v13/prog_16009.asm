; DESCRIPTION: Draws a green line from (474, 189) to (41, 172).
; PLAN: r0=474(x1), r1=189(y1), r2=41(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 189
LDI r2, 41
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
