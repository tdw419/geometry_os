; DESCRIPTION: Renders a red line between points (40, 45) and (333, 40).
; PLAN: r0=40(x1), r1=45(y1), r2=333(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 45
LDI r2, 333
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
