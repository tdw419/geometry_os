; DESCRIPTION: Renders a red line between points (215, 196) and (35, 159).
; PLAN: r0=215(x1), r1=196(y1), r2=35(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 196
LDI r2, 35
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
