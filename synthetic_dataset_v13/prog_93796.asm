; DESCRIPTION: Renders a red line between points (167, 31) and (450, 36).
; PLAN: r0=167(x1), r1=31(y1), r2=450(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 31
LDI r2, 450
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
