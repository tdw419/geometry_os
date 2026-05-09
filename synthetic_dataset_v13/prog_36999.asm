; DESCRIPTION: Renders a red line between points (203, 196) and (342, 16).
; PLAN: r0=203(x1), r1=196(y1), r2=342(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 196
LDI r2, 342
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
