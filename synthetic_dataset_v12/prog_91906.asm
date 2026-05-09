; DESCRIPTION: Renders a red line between points (433, 186) and (183, 67).
; PLAN: r0=433(x1), r1=186(y1), r2=183(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 186
LDI r2, 183
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
