; DESCRIPTION: Places a cyan line segment connecting (330, 52) to (287, 10).
; PLAN: r0=330(x1), r1=52(y1), r2=287(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 52
LDI r2, 287
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
