; DESCRIPTION: Renders a red line between points (355, 162) and (394, 107).
; PLAN: r0=355(x1), r1=162(y1), r2=394(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 162
LDI r2, 394
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
