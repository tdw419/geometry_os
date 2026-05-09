; DESCRIPTION: Renders a red line between points (45, 111) and (82, 144).
; PLAN: r0=45(x1), r1=111(y1), r2=82(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 111
LDI r2, 82
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
