; DESCRIPTION: Renders a red line between points (403, 167) and (405, 15).
; PLAN: r0=403(x1), r1=167(y1), r2=405(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 167
LDI r2, 405
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
