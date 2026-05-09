; DESCRIPTION: Places a red line segment connecting (9, 15) to (281, 198).
; PLAN: r0=9(x1), r1=15(y1), r2=281(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 15
LDI r2, 281
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
