; DESCRIPTION: Renders a red line between points (202, 81) and (207, 57).
; PLAN: r0=202(x1), r1=81(y1), r2=207(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 81
LDI r2, 207
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
