; DESCRIPTION: Renders a red line between points (430, 230) and (445, 146).
; PLAN: r0=430(x1), r1=230(y1), r2=445(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 230
LDI r2, 445
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
