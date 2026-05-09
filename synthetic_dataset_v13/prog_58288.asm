; DESCRIPTION: Places a red line segment connecting (460, 177) to (258, 172).
; PLAN: r0=460(x1), r1=177(y1), r2=258(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 177
LDI r2, 258
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
