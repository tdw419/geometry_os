; DESCRIPTION: Renders a red line between points (117, 250) and (298, 175).
; PLAN: r0=117(x1), r1=250(y1), r2=298(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 250
LDI r2, 298
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
