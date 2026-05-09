; DESCRIPTION: Renders a red line between points (209, 111) and (45, 95).
; PLAN: r0=209(x1), r1=111(y1), r2=45(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 111
LDI r2, 45
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
