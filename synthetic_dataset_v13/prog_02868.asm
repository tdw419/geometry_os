; DESCRIPTION: Renders a red line between points (12, 111) and (150, 176).
; PLAN: r0=12(x1), r1=111(y1), r2=150(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 111
LDI r2, 150
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
