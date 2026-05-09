; DESCRIPTION: Draws a green line from (352, 38) to (26, 141).
; PLAN: r0=352(x1), r1=38(y1), r2=26(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 38
LDI r2, 26
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
