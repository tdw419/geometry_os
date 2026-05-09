; DESCRIPTION: Renders a red line between points (367, 164) and (117, 202).
; PLAN: r0=367(x1), r1=164(y1), r2=117(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 164
LDI r2, 117
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
