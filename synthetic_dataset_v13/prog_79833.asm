; DESCRIPTION: Renders a red line between points (352, 27) and (24, 49).
; PLAN: r0=352(x1), r1=27(y1), r2=24(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 27
LDI r2, 24
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
