; DESCRIPTION: Renders a red line between points (460, 146) and (365, 216).
; PLAN: r0=460(x1), r1=146(y1), r2=365(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 146
LDI r2, 365
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
