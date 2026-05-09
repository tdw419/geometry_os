; DESCRIPTION: Places a red line segment connecting (284, 9) to (9, 29).
; PLAN: r0=284(x1), r1=9(y1), r2=9(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 9
LDI r2, 9
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
