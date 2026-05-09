; DESCRIPTION: Renders a red line between points (368, 67) and (486, 20).
; PLAN: r0=368(x1), r1=67(y1), r2=486(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 67
LDI r2, 486
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
