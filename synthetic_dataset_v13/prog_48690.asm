; DESCRIPTION: Renders a red line between points (277, 19) and (380, 144).
; PLAN: r0=277(x1), r1=19(y1), r2=380(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 19
LDI r2, 380
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
