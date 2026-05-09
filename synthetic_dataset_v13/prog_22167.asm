; DESCRIPTION: Renders a red line between points (503, 69) and (126, 189).
; PLAN: r0=503(x1), r1=69(y1), r2=126(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 69
LDI r2, 126
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
