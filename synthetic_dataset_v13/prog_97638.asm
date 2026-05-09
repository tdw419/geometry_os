; DESCRIPTION: Renders a red line between points (317, 124) and (187, 52).
; PLAN: r0=317(x1), r1=124(y1), r2=187(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 124
LDI r2, 187
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
