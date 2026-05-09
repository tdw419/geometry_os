; DESCRIPTION: Renders a red line between points (205, 155) and (346, 207).
; PLAN: r0=205(x1), r1=155(y1), r2=346(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 155
LDI r2, 346
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
