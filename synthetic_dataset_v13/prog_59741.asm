; DESCRIPTION: Renders a red line between points (153, 213) and (460, 34).
; PLAN: r0=153(x1), r1=213(y1), r2=460(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 213
LDI r2, 460
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
