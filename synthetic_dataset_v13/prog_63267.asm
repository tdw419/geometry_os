; DESCRIPTION: Renders a red line between points (173, 73) and (212, 25).
; PLAN: r0=173(x1), r1=73(y1), r2=212(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 73
LDI r2, 212
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
