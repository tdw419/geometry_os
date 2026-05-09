; DESCRIPTION: Places a red line segment connecting (471, 126) to (284, 137).
; PLAN: r0=471(x1), r1=126(y1), r2=284(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 126
LDI r2, 284
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
