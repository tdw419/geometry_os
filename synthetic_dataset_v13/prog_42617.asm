; DESCRIPTION: Renders a red line between points (303, 173) and (37, 32).
; PLAN: r0=303(x1), r1=173(y1), r2=37(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 173
LDI r2, 37
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
