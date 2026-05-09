; DESCRIPTION: Renders a red line between points (284, 112) and (269, 205).
; PLAN: r0=284(x1), r1=112(y1), r2=269(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 112
LDI r2, 269
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
