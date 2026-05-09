; DESCRIPTION: Renders a red line between points (36, 252) and (284, 126).
; PLAN: r0=36(x1), r1=252(y1), r2=284(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 252
LDI r2, 284
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
