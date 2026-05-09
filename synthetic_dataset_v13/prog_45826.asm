; DESCRIPTION: Renders a red line between points (220, 20) and (333, 107).
; PLAN: r0=220(x1), r1=20(y1), r2=333(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 20
LDI r2, 333
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
