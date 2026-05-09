; DESCRIPTION: Places a green line segment connecting (52, 236) to (352, 6).
; PLAN: r0=52(x1), r1=236(y1), r2=352(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 236
LDI r2, 352
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
