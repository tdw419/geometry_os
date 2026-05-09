; DESCRIPTION: Renders a red line between points (300, 247) and (166, 164).
; PLAN: r0=300(x1), r1=247(y1), r2=166(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 247
LDI r2, 166
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
