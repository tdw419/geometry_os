; DESCRIPTION: Places a cyan line segment connecting (303, 217) to (287, 27).
; PLAN: r0=303(x1), r1=217(y1), r2=287(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 217
LDI r2, 287
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
