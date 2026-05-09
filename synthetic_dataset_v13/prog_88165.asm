; DESCRIPTION: Renders a red line between points (437, 83) and (460, 37).
; PLAN: r0=437(x1), r1=83(y1), r2=460(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 83
LDI r2, 460
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
