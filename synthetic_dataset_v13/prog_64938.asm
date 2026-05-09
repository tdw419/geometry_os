; DESCRIPTION: Renders a red line between points (482, 228) and (452, 186).
; PLAN: r0=482(x1), r1=228(y1), r2=452(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 228
LDI r2, 452
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
