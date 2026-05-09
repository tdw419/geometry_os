; DESCRIPTION: Renders a red line between points (356, 253) and (447, 246).
; PLAN: r0=356(x1), r1=253(y1), r2=447(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 253
LDI r2, 447
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
