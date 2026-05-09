; DESCRIPTION: Renders a red line between points (298, 255) and (264, 15).
; PLAN: r0=298(x1), r1=255(y1), r2=264(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 255
LDI r2, 264
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
