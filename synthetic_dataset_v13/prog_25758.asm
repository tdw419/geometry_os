; DESCRIPTION: Renders a red line between points (48, 35) and (298, 93).
; PLAN: r0=48(x1), r1=35(y1), r2=298(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 35
LDI r2, 298
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
