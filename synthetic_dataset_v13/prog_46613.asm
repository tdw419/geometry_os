; DESCRIPTION: Renders a red line between points (394, 50) and (486, 213).
; PLAN: r0=394(x1), r1=50(y1), r2=486(x2), r3=213(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 50
LDI r2, 486
LDI r3, 213
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
